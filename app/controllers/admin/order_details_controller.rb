class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def index
  end

  def show
  end

  def edit
  end

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_details = @order_detail.order.order_details
    @order_detail.update(order_detail_params)
    is_updated = true
    case @order_detail.status
      when "c"
        @order_detail.order.update(status:'c' ) #製作中
      when "d"
        @order_details.each do |order_detail|
          if order_detail.status != "d"#製作完了
            is_updated = false
          end
        end
        @order_detail.order.update(status: 'd') if is_updated #発送準備中
    end
    redirect_to edit_admin_order_path(@order_detail.order.id)
  end

  def destroy
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:price_tax, :amount, :status)
  end


end
