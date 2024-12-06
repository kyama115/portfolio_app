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
end
