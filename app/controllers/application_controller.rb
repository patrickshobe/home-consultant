class ApplicationController < ActionController::Base

before_action :auth_token

  helper_method :auth_token

  def auth_token
    session[:user]
  end
end
