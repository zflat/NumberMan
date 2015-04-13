class ApplicationController < ActionController::Base
  # Prevent CSRF attacks for APIs using :null_session
  protect_from_forgery with: :null_session


  def current_tenant 
    Tenant.first || Tenant.new
  end
end
