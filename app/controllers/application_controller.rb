class ApplicationController < ActionController::Base
  # Prevent CSRF attacks for APIs using :null_session
  protect_from_forgery with: :null_session
  before_action :authenticate_user!

  def current_tenant 
    current_user.tenant || Tenant.new
  end
  helper_method :current_tenant
end
