module Customers
  class ProfilesController < ApplicationController
    before_action :authenticate_customer!
    before_action :set_customer, only: [:show, :edit, :update]

    def show
      # Displays the customer profile
    end

    def edit
      # Displays the edit form for the customer profile
    end

    def update
      if @customer.update(customer_params)
        redirect_to customers_profile_path(@customer), notice: 'Profile updated successfully.'
      else
        render :edit
      end
    end

    private

    def set_customer
      @customer = current_customer
    end

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :phone_number, :company_name, :address1, :city, :zip_code, :country, :business_type)
    end
  end
end