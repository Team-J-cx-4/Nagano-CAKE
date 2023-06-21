class Admin::OrdersController < ApplicationController
  belongs_to :menber
  has_many :order_details

  def index
  end

  def show
    @item = Item.find(params[:item_id])
    @order = @item.order.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def confirm
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    if params[:order][:select_address] == "0"
      @order.postal_code = current_end_user.postal_code
      @order.address = current_end_user.address
      @order.name = current_end_user.first_name + current_end_user.last_name
    elsif params[:order][:select_address] == "1"
       @address = Address.find(params[:order][:address_id])
       @order.postal_code = @address.postal_code
       @order.address = @address.address
       @order.name = @address.name
    elsif params[:order][:select_address] == "2"
      @order.end_user_id = current_end_user.id
    end
      @cart_items = current_end_user.cart_items
      @order_new = Order.new
      render :confirm
  end

  private

  def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
