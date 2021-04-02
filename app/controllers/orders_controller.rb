class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @order_dealing = OrderDealing.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_dealing = OrderDealing.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_dealing.valid?
      pay_item
      @order_dealing.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_dealing).permit(:street_address_id, :municipality, :address, :postal_code, :phone_number, :building_name).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

     def pay_item
      Payjp.api_key = "sk_test_f657cc1dbd3acd6e164b8142"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
     end
end
