namespace :import do
  desc "店舗イメージをインポート"
  task shops: :environment do
    spreadsheet = Roo::Excelx.new('db/data/shops.xlsx')
    header = spreadsheet.row(1)

    ActiveRecord::Base.transaction do
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]

        shop = Shop.create!(
          title: row['title'],
          address: row['address'],
          description: row['description'],
          area: row['area'],
          budget: row['budget'].to_i,
          scene: row['scene'],
          opening_hours: row['opening_hours'],
          shop_number: row['shop_number'],
          shop_url: row['shop_url'],
          latitude: row['latitude'].to_f,
          longitude: row['longitude'].to_f,
          shop_image: row['shop_image'] # 直接URLを保存
        )

        # Active Storageも使用する場合
        if row['shop_image'].present? && ENV['ATTACH_IMAGES'] == 'true'
          shop.attach_image_from_url(row['shop_image'])
        end
      end
    end
  end
end
