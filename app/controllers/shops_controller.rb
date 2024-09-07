class ShopsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @q = Shop.ransack(params[:q])
    if params[:budget_range]
      @shops = Shop.budget_range(params[:budget_range])
    elsif params[:area]
      @shops = Shop.by_area(params[:area])
    elsif params[:scene]
      @shops = Shop.by_scene(params[:scene])
    else
      @shops = @q.result(distinct: true).order(created_at: :desc)
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true).order(created_at: :desc)
    @review = Review.new
    @reviews = @shop.reviews.includes(:user).order(created_at: :desc)
    @user = current_user
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:title, :description, :area, :budget, :scene, :shop_image, :shop_image_cache)
  end

  # def autocomplete
  #   @shops = Shop.where("title like ?", "%#{params[:q]}%").limit(6)
  #   render partial: 'shops/autocomplete', locals: { shops: @shops }
  # end
end
