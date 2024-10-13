module Customers
  class DashboardController < ApplicationController
    before_action :authenticate_customer!
    before_action :ensure_shop_installed

    def index
      @shop = Shop.first

      if @shop.present? && @shop.shopify_token.present?
        session = ShopifyAPI::Auth::Session.new(
          shop: @shop.shopify_domain, 
          access_token: @shop.shopify_token
        )

        ShopifyAPI::Context.setup(
          api_key: ENV.fetch('SHOPIFY_API_KEY', '').presence,
          api_secret_key: ENV.fetch('SHOPIFY_API_SECRET', '').presence,
          api_version: ENV.fetch('SHOPIFY_API_VERSION', '2024-07').presence,
          scope: ENV.fetch('SHOPIFY_API_SCOPES', '').split(",").join(", "),
          host: ENV.fetch('SHOPIFY_API_SCOPES', request.host).presence,
          is_embedded: ENV.fetch('SHOPIFY_EMBEDDED_APP', 'false').to_s.downcase == 'true',
          is_private: ENV.fetch('SHOPIFY_PRIVATE_APP', 'false').to_s.downcase == 'true',
        )

        ShopifyAPI::Context.activate_session(session)

        if current_customer
          search_query = params[:query].to_s.strip
          if search_query.present?
            @orders = ShopifyAPI::Order.all(customer: current_customer.email).select do |order|
              order.name.include?(search_query)
            end
          else
            @orders = ShopifyAPI::Order.all(customer: current_customer.email)
          end
        else
          redirect_to customer_session_path
        end
      else
        redirect_to shopify_app.login_path
      end
    end

    def show
      order_id = params[:id]
      @order = ShopifyAPI::Order.find(order_id)
    end

    private

    # Ensure the shop has installed the app
    def ensure_shop_installed
      @shop = Shop.first

      unless @shop.present? && @shop.shopify_token.present?
        redirect_to shopify_app.login_path
      end
    end
      def authenticate_customer!
        return if installing_shopify_app?
        super
      end

    def installing_shopify_app?
      params[:hmac].present? && params[:host].present? && params[:shop].present?
    end
  end
end
