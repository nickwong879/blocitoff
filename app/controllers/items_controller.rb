class ItemsController < ApplicationController
  def create
  	@user = current_user
  	@item = @user.items.build(item_params)
    @new_item = Item.new


  	if @item.save
		flash[:notice] = "Item added"
    redirect_to users_show_path
  	else
  	flash[:notice] = "Error adding item, please try again"
  	end
    
 
  end

  def destroy

    @user = current_user
    @item = @user.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item deleted"
    else
      flash[:error] = "Item not deleted.  Try again."
    end

  	respond_to do |format|
  		format.html
  		format.js
  	end

  end

  def index
    @users = User.all
    @items = Item.all
  end


private

def item_params
  params.require(:item).permit(:body, :due_date)
end

end
