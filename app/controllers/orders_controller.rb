class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :redirect_root, only: [:index, :create]

  def index
    @order_dealing = OrderDealing.new
  end

  def create
    @order_dealing = OrderDealing.new(order_params)
    if @order_dealing.valid?
      pay_item
      @order_dealing.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_dealing).permit(:street_address_id, :municipality, :address, :postal_code, :phone_number, :building_name).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_root
    return redirect_to root_path if @item.user_id == current_user.id || @item.order.present?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
