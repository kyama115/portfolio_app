class Admin::SessionsController < Admin::BaseController
  skip_before_action :check_admin, only: %i[new create]

  layout 'admin'

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user && user.valid_password?(params[:password])
      sign_in :user, user
      redirect_to admin_root_path, notice: "ログインしました"
    else
      flash.now[:danger] = "ログインに失敗しました"
      render :new
    end
  end

  def destroy
    sign_out :user
    redirect_to admin_login_path, notice: "ログアウトしました"
  end
end
