-- # Dockerを使用している場合
-- docker compose exec db psql -U postgres -d myapp_development -f /path/to/shops_seed.sql

-- # または
-- cat db/shops_seed.sql | docker compose exec -T db psql -U postgres -d myapp_development

INSERT INTO shops (
  title,
  address,
  description,
  area,
  budget,
  scene,
  opening_hours,
  shop_number,
  shop_url,
  latitude,
  longitude,
  shop_image,
  created_at,
  updated_at
) VALUES
(
  'NORTH VILLAGE 渋谷店',
  '東京都渋谷区神南1丁目20-15 和田ビル3階',
  '渋谷で人気のシーシャ専門店。多彩なフレーバーとくつろぎの空間で本格シーシャが楽しめます。',
  '渋谷',
  3500,
  'デート,友人と,記念日',
  '15:00-翌5:00',
  '050-5594-4137',
  'https://north-village.com/',
  35.6614,
  139.6995,
  'https://images.unsplash.com/photo-1542332213-31f87348057f',
  CURRENT_TIMESTAMP,
  CURRENT_TIMESTAMP
),
-- ... 他の店舗データ ...
;