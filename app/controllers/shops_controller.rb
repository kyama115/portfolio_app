class ShopsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @q = Shop.ransack(params[:q])
    if params[:budget_range]
      @shops = Shop.budget_range(params[:budget_range]).page(params[:page])
    elsif params[:area]
      @shops = Shop.by_area(params[:area]).page(params[:page])
    elsif params[:scene]
      @shops = Shop.by_scene(params[:scene]).page(params[:page])
    else
      @shops = Shop.all.order(created_at: :desc).page(params[:page])
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

  def favorites
    @favorite_shops = current_user.favorite_shops.includes(:user).order(created_at: :desc).page(params[:page])
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
