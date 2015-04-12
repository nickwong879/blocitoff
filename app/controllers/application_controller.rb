class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

def hello
	render text: "<h1>Hello</h1><p>Welcome home</p>"
end

private 

def after_sign_out_path_for(current_user)
        welcome_index_path
end


end
