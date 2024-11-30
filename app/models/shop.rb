class Shop < ApplicationRecord
  require 'geocoder'

  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  has_many :favorites, dependent: :destroy

  has_one_attached :shop_image
  has_many_attached :shop_images

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 65_535 }


  geocoded_by :address
  after_validation :geocode, if: :address_changed?

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
  def self.by_area(area)
    where(area: area)
  end

  # 利用用途に基づいてフィルタリングするメソッド
  def self.by_scene(scene)
    where(scene: scene)
  end

  # URLから画像を添付するメソッド
  def display_image
    if shop_image.attached?
      Rails.application.routes.url_helpers.url_for(shop_image)
    elsif shop_image_url.present?
      shop_image_url
    else
      'shisha.jpg'
    end
  end
end
