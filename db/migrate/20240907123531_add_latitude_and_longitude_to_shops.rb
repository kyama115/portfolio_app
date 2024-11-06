class AddLatitudeAndLongitudeToShops < ActiveRecord::Migration[7.2]
  def change
    add_column :shops, :latitude, :float
    add_column :shops, :longitude, :float
  end
end
