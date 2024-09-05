module ApplicationHelper
  def user_avatar(user, size = 100)
    if user&.avatar&.attached?
      user.avatar.variant(resize: "#{size}x#{size}!")
    else
      # デフォルトのアバター画像のパスを指定
      "default_avatar.png"
    end
  end
end
