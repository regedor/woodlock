class RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |user|
      user.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.for(:account_update) do |user|
      user.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
    end
  end
end
