module ApplicationHelper
  include Devise::Controllers::Helpers

  def active_if(path)
    current_page?(path) ? 'bg-gray-100 text-gray-900' : 'text-gray-600'
  end

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

  def x_share_url(shop)
    text = "#{shop.title} - シーシャ検索サイトで見つけました！"
    url = shop_url(shop)
    "https://x.com/intent/tweet?text=#{URI.encode_www_form_component(text)}&url=#{URI.encode_www_form_component(url)}"
  end

  def facebook_share_url(shop)
    url = shop_url(shop)
    "https://www.facebook.com/sharer/sharer.php?u=#{URI.encode_www_form_component(url)}"
  end

  def instagram_share_url(shop)
    # Instagramは直接シェアリンクを提供していないため、プロフィールページに遷移します
    "https://www.instagram.com/#{shop.title.gsub(' ', '_')}"
  end
end
