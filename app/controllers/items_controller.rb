class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
   end

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :item_condition_id, :delivery_fee_id, :delivery_day_id,
                                 :street_address_id, :price, :image).merge(user_id: current_user.id)
  end
end
