module ShopsHelper
  def shop_display_image(shop)
    if shop.shop_image.attached?
      url_for(shop.shop_image)
    elsif shop.shop_image.present?
      shop.shop_image
    else
      'shisha.jpg'
    end
  end
end
