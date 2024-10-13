class ApplicationController < ActionController::Base
  # before_action :log_request_endpoint

  private

  # def log_request_endpoint
  #   Rails.logger.info "Requested endpoint: #{request.fullpath}" # Logs the full request path
  #   # or you can use
  #   # Rails.logger.info "Requested endpoint: #{request.path}" # Logs only the path without query parameters
  # end

  protected

  def after_sign_out_path_for(resource_or_scope)
    customer_session_path # or any other path you want to redirect to
  end
end
