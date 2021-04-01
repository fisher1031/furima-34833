class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    #@orders = Order.all
    @order_dealing = OrderDealing.new
    @item = Item.find(params[:item_id])
  end

  def new
    #@order = Order.new
  end

  def create
    #@order = Order.new(order_params)
    @order_dealing = OrderDealing.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_dealing.valid?
      @order_dealing.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    #params.require(:order).merge(user_id: current_user.id, item_id: current_item.id)
    params.require(:order_dealing).permit(:street_address_id, :municipality, :address, :postal_code, :phone_number, :building_name).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
