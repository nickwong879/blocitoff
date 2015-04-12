class ItemsController < ApplicationController
  def create
  	@user = current_user
  	@item = current_user.items.build( item_params )

  	if @item.save
		flash[:notice] = "Item added"
  		redirect_to users_show_path  		
  	end

  end

private

def item_params
  params.require(:item).permit(:body)
end

end
