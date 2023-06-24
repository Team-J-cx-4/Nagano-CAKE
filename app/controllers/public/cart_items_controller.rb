class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    if CartItem.find_by(item.id)
      @cart_item.quantity += @update_cart_item.quantity.to_i
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.item_id = params[:item_id]
      if @cart_item.save
      redirect_to cart_items_path
      else
      render "customer/items/index"
      end
    end
  end

  def update
    @cart_item.item_id = params[:item_id]
    @cart_item.update(cart_item_params)
  end

  def destroy
    @cart_item = Cartitem.find(params[:id])
    @cart_item.destroy
    flash[:alert] = "#{@cart_item.item.name}を削除しまし"
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
