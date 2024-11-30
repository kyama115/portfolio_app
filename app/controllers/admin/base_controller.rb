class Admin::BaseController < ApplicationController
  before_action :check_admin
  helper_method :admin_user_signed_in?

  private

  def not_authenticated
    flash[:danger] = "ログインしてください"
    redirect_to admin_login_path
  end

  def check_admin
    unless current_user.admin?
      flash[:danger] = "このユーザーは管理者ではありません"
      redirect_to root_path
    end
  end

  def admin_user_signed_in?
    current_user && current_user.admin?
  end
end
