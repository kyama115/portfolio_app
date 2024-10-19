class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :shops, through: :reviews
  has_many :favorites, dependent: :destroy
  has_many :favorite_shops, through: :favorites, source: :shop

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]

  VALID_NAME_REGEX = /\A.*\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  validates :name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :nickname, length: { maximum: 20 }
  validate :password_match
  validates :uid, uniqueness: { scope: :provider }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      # user.name = auth.info.name
      # user.nickname = auth.info.nickname || auth.info.name.gsub(/\s+/, "").downcase
      # user.image = auth.info.image
      # user.avatar = auth.info.image
    end
  end

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  def own?(object)
    id == object&.user_id
  end

  def favorite(shop)
    favorite_shops << shop
  end

   def unfavorite(shop)
    favorite_shops.destroy(shop)
  end

   def favorite?(shop)
    favorite_shops.include?(shop)
  end

  # アバターのバリデーション（オプション）
  validate :acceptable_avatar

  def avatar_persisted?
    avatar.attached? && avatar.persisted?
  end

  def log(level, message)
    logger = OmniAuth.logger || Rails.logger
    logger.send(level, "(#{name}) #{message}")
  end

  private

  def password_match
    errors.add(:password_confirmation, "パスワードが一致しません") if password != password_confirmation
  end

  def acceptable_avatar
    return unless avatar.attached?

    unless avatar.blob.byte_size <= 5.megabyte
      errors.add(:avatar, "は5MB以下にしてください")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(avatar.content_type)
      errors.add(:avatar, "はJPEGまたはPNG形式でアップロードしてください")
    end
  end
end
