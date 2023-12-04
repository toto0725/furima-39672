class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end
  
 

  def create

    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
  
    if @order_address.valid?
      Payjp.api_key = "sk_test_46f4cde4de8fd99bb6241818"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy')
      
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end
  
  
  
  private
 
    
    
    def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, ).merge(user_id: current_user.id, item_id:params[:item_id], token: params[:token], )
  end 

end
