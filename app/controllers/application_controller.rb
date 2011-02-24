class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :verify_access

  def verify_access
    authenticate_or_request_with_http_basic("mongoloadtest") do |username, password|
      username == "mongoloadtest" and password == "mongomongo"
    end
  end
end
