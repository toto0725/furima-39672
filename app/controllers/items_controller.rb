class ItemsController < ApplicationController

def index
end

def new
  @item = Item.new
end

def create
  if @item.create(item_params)
    redirect_to root_path
  else
    render :new, status: :unprocessable_entity
  end
end




private

def item_params
  params.require(:item).permit(:name, :info, :price, :category_id, :fee_id, :prefecture_id, :delivery_id,).merge(user_id: current_user.id)
end


end
