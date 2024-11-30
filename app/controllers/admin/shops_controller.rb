class Admin::ShopsController < Admin::BaseController
  before_action :set_shop, only: %i[edit update show destroy]

  layout 'admin'

  def index
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true).includes(%i[users]).order(created_at: :asc).page(params[:page])
    @total_shops_count = Shop.count
  end

  def new
    @shop = Shop.new
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      redirect_to admin_shop_path(@shop), success: '店舗情報を更新しました', item: Shop.model_name.human
    else
      flash.now[:danger] = '店舗情報の更新に失敗しました'
      render :new
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    if @shop.update(shop_params)
      redirect_to admin_shop_path(@shop), success: '店舗情報を更新しました', item: Shop.model_name.human
    else
      flash.now[:danger] = '店舗情報の更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @shop.destroy!
    redirect_to admin_shops_path, success: '店舗情報を削除しました', data: { turbo_method: :delete, turbo_confirm: t('shops.destroy.delete_confirm') }, status: :see_other, item: Shop.model_name.human
  end

  def destroy_image
    @shop = Shop.find(params[:id])
    @shop.shop_image.purge  # Active Storage で画像を削除
    redirect_to edit_admin_shop_path(@shop), notice: '画像が削除されました。'
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:title, :description, :shop_image, :shop_image_cache, :address, :area, :budget, :scene, :opening_hours, :shop_number, :latitude, :longitude, :shop_url, :image, :image_cache)
  end
end
