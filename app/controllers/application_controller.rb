class ApplicationController < ActionController::API
  # before_filter :ensure_json_request
  # def ensure_json_request
  #   return if request.headers [ "Accept" ] =~ /json/
  #   render nothing: true, status: 406
  # end
  # 
  before_action :ensure_json_request

  def ensure_json_request
    return if request.headers["Accept"] =~ /json/
    head :not_acceptable
  end

  include Rails.application.routes.url_helpers
end
