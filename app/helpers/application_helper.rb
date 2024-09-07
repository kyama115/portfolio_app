module ApplicationHelper
  include Devise::Controllers::Helpers

  def user_avatar(user, size = 100)
    if user&.avatar&.attached?
      user.avatar.variant(resize: "#{size}x#{size}!")
    else
      # デフォルトのアバター画像のパスを指定
      "default_avatar.png"
    end
  end

  def shop_image(shop, size = 100)
    if shop&.shop_image&.attached?
      shop.shop_image.variant(resize: "#{size}x#{size}!")
    else
      "shisha.jpg"
    end
  end
end
