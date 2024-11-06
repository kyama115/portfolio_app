class RemoveShopImageFromShops < ActiveRecord::Migration[7.0]
  def change
    remove_column :shops, :shop_image, :string
  end
end