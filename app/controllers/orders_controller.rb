class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :sold_check, only: [:index]
  before_action :set_order, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']

    @order_address = OrderAddress.new
    redirect_to root_path if current_user == @item.user
  end

  def create
    @order_address = OrderAddress.new(order_params)

    if @order_address.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )

      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def sold_check
    @item = Item.find(params[:item_id])
    return unless @item.order.present? && @item.user_id != current_user.id

    redirect_to root_path
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end
end
