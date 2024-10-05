class ShopsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true)

    @shops = @shops.budget_range(params[:budget_range]) if params[:budget_range].present?
    @shops = @shops.by_area(params[:area]) if params[:area].present?
    @shops = @shops.by_scene(params[:scene]) if params[:scene].present?

    @shops = @shops.includes(:shop_image_attachment)
                   .order(created_at: :desc)
                   .page(params[:page])

    # デバッグ用ログ
    Rails.logger.debug "Search params: #{params[:q].inspect}"
    Rails.logger.debug "Generated SQL: #{@shops.to_sql}"
    Rails.logger.debug "Result count: #{@shops.count}"
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
    @favorite_shops = current_user.favorite_shops.includes(:user).order(created_at: :desc).page(params[:page])
  end

  def autocomplete
    @shops = Shop.where("title ILIKE ?", "%#{params[:q]}%").limit(5)
    render json: @shops.map { |shop| { id: shop.id, title: shop.title } }
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:title, :description, :area, :budget, :scene, :shop_image, :shop_image_cache)
  end

  def search_params
    params.require(:q).permit(:title_or_description_or_area_or_scene_cont, :id_eq)
  end
end
