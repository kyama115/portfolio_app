# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  protect_from_forgery prepend: true, with: :exception
  skip_before_action :verify_authenticity_token, only: :create, if: :skip_csrf_token?
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
  def create
    self.resource = warden.authenticate!(auth_options)
    
    if self.resource
      sign_in(resource_name, resource)
      flash[:notice] = 'ログインしました'
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      flash.now[:alert] = 'メールアドレスまたはパスワードが違います'
      render :new
    end
  rescue => e
    flash.now[:alert] = 'ログインに失敗しました'
    render :new
  end

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

  private

  def skip_csrf_token?
    request.path.match?(/^\/users\/auth\//)
  end
end
