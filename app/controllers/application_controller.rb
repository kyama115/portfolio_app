class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  #認証されていないユーザーをリダイレクト
  def not_authenticated
    redirect_to new_user_session_path
  end

  def authenticate_user!
    super
  end

  protected

  # ユーザー登録時に追加できるパラメーターを設定
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :nickname, :avatar])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end

  # def set_locale
  #   I18n.locale = params[:locale] || I18n.default_locale
  # end

  # def default_url_options
  #   { locale: I18n.locale }
  # end
end
