class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:fname, :lname, :contact, :gender, :bday,
      :address, :city, :state, :pincode, :avatar])
  end

  # def is_admin?
  #   unless current_user.has_role?(:admin)
  #     flash[:alert] = "You don't have the authorization to visit this page"
  #     redirect_back fallback_location: root_path
  #   end
  # end
end
