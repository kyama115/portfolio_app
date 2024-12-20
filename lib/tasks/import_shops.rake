# lib/tasks/import_shops.rake

namespace :import do
  desc "Import shops with images"
  task :shops, [:file_path] => :environment do |_, args|
    file_path = args[:file_path] || 'storage/import/stores.xlsx'

    unless File.exist?(file_path)
      puts "Error: File not found at #{file_path}"
      exit
    end

    begin
      spreadsheet = Roo::Excelx.new(file_path)
      header = spreadsheet.row(1)

      puts "Starting import process..."
      imported_count = 0
      updated_count = 0

      ActiveRecord::Base.transaction do
        (2..spreadsheet.last_row).each do |i|
          row = Hash[[header, spreadsheet.row(i)].transpose]

          # budgetの値を適切に処理
          budget_value = if row['budget'].present?
            row['budget'].to_s.gsub(/[^\d]/, '').to_i
          else
            nil
          end

          # 既存の店舗を検索し、存在すれば更新、なければ作成
          shop = Shop.find_or_initialize_by(title: row['title'])

          shop.assign_attributes(
            address: row['address'],
            opening_hours: row['opening_hours'],
            latitude: row['latitude'].to_f,
            longitude: row['longitude'].to_f,
            area: row['area'],
            budget: budget_value,
            scene: row['scene'],
            shop_number: row['shop_number'],
            shop_url: row['shop_url']
          )

          if shop.new_record?
            imported_count += 1
          else
            updated_count += 1
          end

          shop.save!

          if row['shop_image'].present? && ENV['ATTACH_IMAGES'] == 'true'
            shop.attach_image_from_url(row['shop_image'])
          end

          print "."
        end
      end

      puts "\nImport completed successfully!"
      puts "#{imported_count} shops imported"
      puts "#{updated_count} shops updated"

    rescue StandardError => e
      puts "\nError during import: #{e.message}"
      puts e.backtrace
    end
  end
end
