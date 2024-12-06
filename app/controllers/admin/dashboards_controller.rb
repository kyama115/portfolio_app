class Admin::DashboardsController < Admin::BaseController
  before_action :authenticate_admin!
  before_action :check_admin

  layout 'admin'

  def index
    @users = User.all
    @shops = Shop.all
  end

  private

  def authenticate_admin!
    redirect_to new_user_session_path unless current_user.admin?
  end
end
