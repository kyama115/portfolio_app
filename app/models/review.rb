class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  validates :content, presence: true, length: { maximum: 65_535 }
end
