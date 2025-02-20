# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  ### # NOTE how to redirect when user cannot be authenticated
  ### # https://github.com/heartcombo/devise/wiki/How-To%3A-Redirect-to-a-specific-page-when-the-user-can-not-be-authenticated

  def create
    if resource_class.find_for_authentication(email: sign_in_params[:email])&.valid_password? sign_in_params[:password]
      super
    else
      redirect_to sign_in_path, alert: 'Invalid email or password'
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_pBackgroundWorker.trigger(resource)arameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(_resource)
    dashboard_path
  end
end
