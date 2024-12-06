# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Dockerを使用している場合
# docker compose exec web rails db:seed

# または
# docker compose run --rm web rails db:seed


shops_data = [
  {
    title: 'NORTH VILLAGE 渋谷店',
    address: '東京都渋谷区神南1丁目20-15 和田ビル3階',
    description: '渋谷で人気のシーシャ専門店。多彩なフレーバーとくつろぎの空間で本格シーシャが楽しめます。',
    area: '渋谷',
    budget: 3500,
    scene: 'デート,友人と,記念日',
    opening_hours: '15:00-翌5:00',
    shop_number: '050-5594-4137',
    shop_url: 'https://north-village.com/',
    latitude: 35.6614,
    longitude: 139.6995,
    shop_image: 'https://images.unsplash.com/photo-1542332213-31f87348057f'
  },
  {
    title: 'SHISHA TOKYO 六本木店',
    address: '東京都港区六本木7-8-5 六本木STビル3F',
    description: '六本木の中心地で楽しめる本格シーシャ。上質な空間で極上のひとときを。',
    area: '六本木',
    budget: 4500,
    scene: 'デート,女子会,記念日',
    opening_hours: '19:00-翌5:00',
    shop_number: '03-6438-9449',
    shop_url: 'https://shisha-tokyo.com/',
    latitude: 35.6637,
    longitude: 139.7315,
    shop_image: 'https://images.unsplash.com/photo-1486149985063-dbebfdbff90d'
  },
  # ... 他の店舗データ ..
]

# 既存のデータを削除（オプション）
Shop.destroy_all

# タイムスタンプを現在時刻に設定
current_time = Time.current

# データを一括で作成
shops_data.each do |shop_data|
  shop_data.merge!(
    created_at: current_time,
    updated_at: current_time
  )
end

# バルクインサート
Shop.insert_all(shops_data)

puts "#{shops_data.length}件の店舗データを作成しました。"
