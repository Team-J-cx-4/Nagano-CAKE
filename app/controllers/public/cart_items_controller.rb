class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @billing_price = 0
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    @new_cart_item = CartItem.new(cart_item_params)
    if params[:cart_item][:amount] == ""
      redirect_to item_path(params[:cart_item][:item_id])
      return
    end
    if @cart_item
      @cart_item.amount += @new_cart_item.amount
      @cart_item.save
      redirect_to cart_items_path
    else
      @new_cart_item.customer_id = current_customer.id
      if @new_cart_item.save
        redirect_to cart_items_path
      else
        @item = Item.find(params[:cart_item][:item_id])
        render "/public/items/show"
      end
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    flash[:alert] = "#{@cart_item.item.name}を削除しました"
    redirect_to cart_items_path
  end

  def all_destroy
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    flash[:alert] = "カートの商品を全て削除しました"
    redirect_to cart_items_path
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
