# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  skip_before_action :authenticate_user!, only: %i[new create]
  skip_before_action :require_no_authentication, only: [:edit, :update]

  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    self.resource = resource_class.find_by(reset_password_token: params[:reset_password_token])
    set_minimum_password_length
    if self.resource
      render :edit
    else
      redirect_to new_user_session_path, alert: "パスワードリセットトークンが無効です。"
    end
  end

  # PUT /resource/password
  # def update
  #   super
  # end

  protected

  def after_resetting_password_path_for(resource)
    super(resource)
  end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
