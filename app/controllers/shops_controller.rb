class ShopsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show autocomplete]

  def index
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true)

    @shops = @shops.budget_range(params[:budget_range]) if params[:budget_range].present?
    @shops = @shops.by_area(normalize_area(params[:area])) if params[:area].present?
    @shops = @shops.by_scene(params[:scene]) if params[:scene].present?

    @shops = @shops.includes(:shop_image_attachment)
                   .order(created_at: :desc)
                   .page(params[:page])
  end

  def show
    @shop = Shop.find(params[:id])
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true).order(created_at: :desc)
    @review = Review.new
    @reviews = @shop.reviews.includes(:user).order(created_at: :desc)
    @user = current_user
  end

  def favorites
    @favorite_shops = current_user.favorite_shops.order(created_at: :desc).page(params[:page])
  end

  def autocomplete
    @shops = Shop.where("title ILIKE ?", "%#{params[:q]}%").limit(5)
    render json: @shops.map { |shop| { id: shop.id, name: shop.title } }
  end

  def map
    @shops = Shop.all
    @q = Shop.ransack(params[:q])

    respond_to do |format|
      format.html
      format.json do
        begin
          if params[:lat].present? && params[:lng].present?
            lat = Float(params[:lat])
            lng = Float(params[:lng])

            Rails.logger.info "Searching shops near: [#{lat}, #{lng}]"

            # まずデータベースに店舗があるか確認
            total_shops = Shop.count
            shops_with_coords = Shop.where.not(latitude: nil, longitude: nil).count
            Rails.logger.info "Total shops: #{total_shops}, Shops with coordinates: #{shops_with_coords}"

            @shops = Shop.where.not(latitude: nil, longitude: nil)
            Rails.logger.info "Found #{@shops.count} shops with coordinates"

          else
            @shops = Shop.where.not(latitude: nil, longitude: nil)
          end

          render json: @shops.as_json(
            only: [:id, :title, :latitude, :longitude, :address, :description]
          )
        rescue => e
          Rails.logger.error "Error in map action: #{e.class.name} : #{e.message}"
          Rails.logger.error e.backtrace.join("\n")
          render json: { error: e.message }, status: :internal_server_error
        end
      end
    end
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:title, :description, :area, :budget, :scene, :shop_image, :shop_image_cache, :lat, :lng, :format)
  end

  def search_params
    params.require(:q).permit(:title_or_description_or_area_or_scene_cont, :id_eq, :lat, :lng, :format)
  end

  def normalize_area(area)
    return nil unless area

    # 区と市を除去するパターン
    area.gsub(/(区|市)$/, '').strip
  end
end
