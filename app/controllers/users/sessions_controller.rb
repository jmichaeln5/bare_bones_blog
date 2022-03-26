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
    self.resource = warden.authenticate(auth_options)
    if self.resource == nil
      redirect_to sign_in_path, alert:"Incorrect email or password."
    else
      super
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # def after_sign_in_path_for(resource)
  #   dashboard_path
  # end
end
