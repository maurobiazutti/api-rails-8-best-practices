class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :ensure_json_request
  # Ensures that only JSON requests are accepted
  # If the request's Accept header does not include application/json, then
  # return a 406 status code, indicating that the request is not acceptable.
  def ensure_json_request
    return if request.headers["Accept"] =~ /json/
    head :not_acceptable
  end

  include Rails.application.routes.url_helpers
end
