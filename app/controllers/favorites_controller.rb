class FavoritesController < ApplicationController
  before_action :set_shop, only: %i[index create destroy]

  def index
    @favorite_shops = current_user.favorite_shops
  end

  def create
    current_user.favorite(@shop)
    @favorite_shops = current_user.favorite_shops.includes(:user).order(created_at: :desc).page(params[:page])
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to request.referer || root_path }
    end
  end

  def destroy
    current_user.unfavorite(@shop)
    @favorite_shops = current_user.favorite_shops.includes(:user).order(created_at: :desc).page(params[:page])
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to request.referer || root_path }
    end
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
