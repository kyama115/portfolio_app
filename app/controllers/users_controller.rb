class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show update destroy]
  before_action :set_user, only: %i[show update destroy]

  def show
    @user = User.find(params[:id])
    @resource_name = :user
  end

  def update
    if @user.update(user_params)
      if params[:user][:avatar].present?
        @user.avatar.attach(params[:user][:avatar])
      end
      redirect_to user_path(@user), notice: "ユーザー情報を更新しました"
    else
      flash.now[:alert] = "ユーザー情報の更新に失敗しました"
      redirect_to user_path(current_user)
    end
  end

  def destroy
    if current_user.destroy!
      redirect_to new_user_session_path, notice: "ユーザーを削除しました"
    else
      flash.now[:alert] = "ユーザーの削除に失敗しました"
      redirect_to user_path(current_user)
    end
  end

  def delete_avatar
    current_user.avatar.purge
    redirect_to user_path(current_user), notice: "プロフィール画像を削除しました"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :nickname, :avatar)
  end
end
