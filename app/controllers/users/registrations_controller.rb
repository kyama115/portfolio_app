# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  protect_from_forgery with: :exception

  skip_before_action :require_no_authentication, only: %i[new create]
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   @user = User.new
  # end

  # # POST /resource
  def create
    @user = User.new(sign_up_params)
    if @user.save
      redirect_to new_user_session_path, notice: 'ユーザー登録が完了しました'
    else
      flash[:alert] = @user.errors.full_messages.join(', ')
      respond_with_navigational(@user) { render :new }
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    super do |resource|
      if account_update_params[:avatar].present?
        resource.avatar.attach(account_update_params[:avatar])
      end
    end
  end

  # # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  def delete_avatar
    current_user.avatar.purge if current_user.avatar.attached?
    respond_to do |format|
      format.html { redirect_to edit_user_registration_path }
      format.turbo_stream
    end
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :nickname, :avatar])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation, :current_password, :nickname, :avatar])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    redirect_to new_user_session_path
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end

  # # パスワードなしで更新できるメソッド
  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  # end

  # # 編集後のリダイレクト先を指定するメソッド
  # def after_update_path_for(resource)
  #   user_path(resource)
  # end
end
