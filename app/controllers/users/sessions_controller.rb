# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  skip_before_action :require_no_authentication, only: %i[new create]
  before_action :configure_permitted_parameters, only: [:create]

  # GET /resource/sign_in
  # def new
  #   # if user_signed_in?
  #   #   redirect_to root_path, alert: 'すでにログインしています。'
  #   # else
  #     @user = User.new
  #   # end
  # end

  # # POST /resource/sign_in
  # def create
  #   @user = User.find(sign_in_params)
  #   if @user.save
  #     redirect_to root_path, notice: 'ログインが完了しました'
  #   else
  #     render :new
  #   end
  # end

  # # DELETE /resource/sign_out
  # def destroy
  #   sign_out(current_user)
  #   redirect_to root_path, notice: 'ログアウトが完了しました'
  # end

  protected

  # The path used after signing in.
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
  end

  # The path used after signing out.
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
