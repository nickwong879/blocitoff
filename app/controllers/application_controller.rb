class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError do |exception|
  	redirect_to root_url, alert: exception.message
  end

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :name
  end

  def index
  	@items = Item.all
  	@users = User.all
  end

private 

def after_sign_out_path_for(current_user)
        welcome_index_path
end

end
