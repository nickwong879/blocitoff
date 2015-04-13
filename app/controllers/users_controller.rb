class UsersController < ApplicationController
  def show
  		if current_user
  		@user = current_user
		@items = @user.items	
		else
		redirect_to welcome_index_path
		end
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
  
  def index
    @users = User.all
    @items = Item.all
  end

private

def user_params
	params.require(:user).permit(:name, :avatar, :avatar_cache, :about, :bio, :item)
end

end



