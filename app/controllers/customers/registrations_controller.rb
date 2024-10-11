class Customers::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number, :company_name, :website, :sales_tax_id, :address1, :suite_unit_apartment, :city, :zip_code, :country, :business_type])
  end
end
