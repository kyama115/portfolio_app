class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: %i[show edit update destroy]

  layout 'admin'

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).order(created_at: :desc).page(params[:page])
    @total_users_count = User.count
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_user_path(@user), success: 'ユーザーを作成しました', item: User.model_name.human
    else
      flash.now[:danger] = 'ユーザーの作成に失敗しました: ' + @user.errors.full_messages.join(', ')
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), success: 'ユーザー情報を更新しました', item: User.model_name.human
    else
      flash.now[:danger] = 'ユーザー情報の更新に失敗しました'
      render :edit
    end
  end

  def destroy
    @user.destroy!
    redirect_to admin_users_path, success: 'ユーザーを削除しました', data: { turbo_method: :delete, turbo_confirm: t('users.destroy.delete_confirm') }, status: :see_other, item: User.model_name.human
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :nickname, :avatar, :role)
  end
end
