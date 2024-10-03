class FavoritesController < ApplicationController
  before_action :set_shop, only: %i[create destroy]

  def index
    @favorite_shops = current_user.favorite_shops
  end

  def create
    @shop = Shop.find(params[:shop_id])
    current_user.favorite(@shop)
  end

  def destroy
    @shop = current_user.favorite_shops.find(params[:id])
    current_user.unfavorite(@shop)
  end

  private

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end
end
