class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order_destination = OrderDestination.new
    @item = Item.find(params[:item_id])
    if Order.exists?(item_id: @item.id) || current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_destination.valid?
      @order_destination.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_destination).permit(:post_number, :prefecture_id, :municipality, :street_address, :building_name, :phone_number).merge( user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end
