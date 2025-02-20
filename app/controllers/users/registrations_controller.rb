# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    resource || build_resource(sign_up_params)

    if resource.invalid?
      tags = resource.errors.full_messages.map { |msg| helpers.tag.p msg, class: 'alert', style: 'color: red' }
      render turbo_stream: turbo_stream.update_all('.alert', tags.join.html_safe)
    else
      super
    end
  end

  # GET /resource/edit
  def edit
    @show_password = true
    super
  end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
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

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name phone_number])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name phone_number])
  end

  def after_sign_up_path_for(_resource)
    dashboard_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   # super(resource)
  #   thank_you_path
  # end

  def after_update_path_for(_resource)
    dashboard_path
  end
end
