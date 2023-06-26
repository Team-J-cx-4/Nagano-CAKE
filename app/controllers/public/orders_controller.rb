class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = Address.all
  end

  def index
    @orders = Order.where(customer_id:current_customer)
    @order = Order.new
  end

  def show
    @orders = Order.all
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    @customer = @order.customer

    if params[:id] == "confirm"
    redirect_to new_order_path
    else
      @order = Order.find(params[:id])
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items.all

    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = order.id
      @order_details.item_id = cart_item.item.id
      @order_details.price_tax = cart_item.item.price
      @order_details.amount = cart_item.amount
      @order_details.status = 0
      @order_details.save
    end

    CartItem.destroy_all
    redirect_to orders_thanx_path

  end



    def cartitem_nill
     cart_items = current_customer.cart_items
     if cart_items.blank?

　　# 　注文完了画面に遷移させる
      redirect_to cart_items_path
     end
    end

  def confirm
    @Order = Order.new
    @cart_items = current_customer.cart_items.includes(:item)
    @order = Order.new(order_params)
    @order.post_code = current_customer.post_code
    @order.address = current_customer.address
    @order.adressed_name = current_customer.first_name + current_customer.last_name
  end

  def thanx
  end

  private

  def order_params
  params.require(:order).permit(:payment_method, :post_code, :address, :adressed_name)
  end
  

end
