class UsersController < ApplicationController
  def show
  		@user = current_user
		@items = @user.items	
  end

  def update
  		if current_user.update_attributes(user_params)
			flash[:notice] = "User information updated"
			redirect_to users_show_path
		else
			flash[:error] = "Invalid user information"
			redirect_to edit_user_registration_path
		end
  end


private

def user_params
	params.require(:user).permit(:name, :avatar, :avatar_cache, :about, :bio, :item)
end

end



