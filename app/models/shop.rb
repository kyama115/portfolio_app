class Shop < ApplicationRecord
  require 'geocoder'

  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  has_many :favorites, dependent: :destroy

  has_one_attached :shop_image
  has_many_attached :shop_images

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 65_535 }
  validates :latitude, numericality: { allow_nil: true }
  validates :longitude, numericality: { allow_nil: true }

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # 有効な座標を持つレコードのみを返すスコープ
  scope :with_valid_coordinates, -> {
    where.not(latitude: nil, longitude: nil)
  }

  # 東京都のその他のエリアを取得
  scope :in_other_tokyo, -> do
    where("area LIKE ANY (ARRAY[?])", 
      ['八王子%', '立川%', '武蔵野%', '三鷹%', '青梅%', '府中%', 
       '昭島%', '調布%', '町田%', '小金井%', '小平%', '日野%',
       '東村山%', '国分寺%', '国立%', '福生%', '狛江%', '東大和%',
       '清瀬%', '東久留米%', '武蔵村山%', '多摩%', '稲城%', '羽村%',
       'あきる野%', '西東京%'])
  end

  # 神奈川県のその他のエリアを取得
  scope :in_other_kanagawa, -> do
    where("area LIKE ANY (ARRAY[?])", 
      ['相模原%', '横須賀%', '平塚%', '鎌倉%',
       '藤沢%', '小田原%', '茅ヶ崎%', '逗子%', '三浦%', '秦野%',
       '厚木%', '大和%', '伊勢原%', '海老名%', '座間%', '南足柄%',
       '綾瀬%'])
  end

  def area_display
    area.presence || ""
  end

  def area_display
    return "" if area.blank?

    # エリアが既に市または区で終わっている場合はそのまま返す
    return area if area.match?(/(市|区)$/)

    # 23区のエリアの場合は区を付ける
    return "#{area}区" if self.class.tokyo_wards.include?(area)

    # その他の市の場合は市を付ける
    return "#{area}市" if self.class.tokyo_cities.include?(area) || self.class.kanagawa_cities.include?(area)

    # どちらにも該当しない場合はそのまま返す
    area
  end

  def favorite_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[id title address description area budget scene opening_hours shop_number shop_url created_at updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end

  # カスタム検索メソッドを定義
  def self.ransackable_scopes(_auth_object = nil)
    %i[budget_range]
  end

  # 全文検索用のスコープ
  scope :search_full_text, ->(query) {
    where(
      "title ILIKE :q OR description ILIKE :q OR area ILIKE :q OR
       CAST(budget AS TEXT) ILIKE :q OR scene ILIKE :q OR address ILIKE :q",
      q: "%#{sanitize_sql_like(query)}%"
    )
  }

  # budgetカラムを文字列として検索するためのransacker
  ransacker :budget do
    Arel.sql("CAST(budget AS TEXT)")
  end

  # 予算が指定された範囲内であるかを確認するメソッド
  def self.budget_between(min_budget, max_budget)
    where('budget >= ? AND budget <= ?', min_budget, max_budget)
  end

  # パラメータから予算範囲を解析し、適切なスコープを適用
  def self.budget_range(range)
    min_budget, max_budget = range.split('-').map(&:to_i)
    budget_between(min_budget, max_budget)
  end

  # エリアに基づいてフィルタリングするメソッド
  scope :by_area, ->(area) {
    return all unless area.present?
    normalized_area = area.gsub(/(区|市)$/, '').strip
    where("area LIKE ?", "%#{normalized_area}%")
  }

  # 利用用途に基づいてフィルタリングするメソッド
  def self.by_scene(scene)
    where(scene: scene)
  end

  # URLから画像を添付するメソッド
  def display_image
    if image_url.present?
      # Google Maps APIのURLから実際の画像URLを取得
      response = Net::HTTP.get_response(URI(image_url))
      # リダイレクト先のURLを返す（実際の画像URL）
      response['location']
    else
      # デフォルト画像のパスを返す
      'shisha.jpg'
    end
  end

  private

  def self.tokyo_cities
    %w(
      八王子 立川 武蔵野 三鷹 青梅 府中
      昭島 調布 町田 小金井 小平 日野
      東村山 国分寺 国立 福生 狛江 東大和
      清瀬 東久留米 武蔵村山 多摩 稲城 羽村
      あきる野 西東京
    )
  end

  def self.tokyo_wards
    %w(
      千代田 中央 港 新宿 文京 台東
      墨田 江東 品川 目黒 大田 世田谷
      渋谷 中野 杉並 豊島 北 荒川
      板橋 練馬 足立 葛飾 江戸川
    )
  end

  def self.kanagawa_cities
    %w(
      横浜 川崎 相模原 横須賀 平塚 鎌倉
      藤沢 小田原 茅ヶ崎 逗子 三浦 秦野
      厚木 大和 伊勢原 海老名 座間 南足柄
      綾瀬
    )
  end
end
