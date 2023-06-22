class Public::CartItemsController < ApplicationController

  def index
    @cart_item.customer_id = current_customer.id
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.item_id = params[:item_id]
  end

  def update
    @cart_item.item_id = params[:item_id]
    @cart_item.update(cart_item_params)
  end

  def destroy
    @cart_item = Cartitem.find(params[:id])
    @cart_item.destro
    flash[:alert] = "#{@cart_item.item.name}を削除しまし"
    redirect_to cart_items_pash
  end

  def all_destroy
    @cart_items.destroy_all
    flash[:alert] = "カートの商品を全て削除しました"
    redirect_to cart_items_path
  end

end
