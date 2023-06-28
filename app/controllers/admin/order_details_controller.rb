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
		@order_details = OrderDetail.where(order_id: params[:id])
		@order_detail.update(order_detail_params)
		# byebug
		is_updated = true
		case @order_detail.status
		when "c"
				@order_detail.order.update(status:'c' ) #"製作中")
		when "d"
	     @order_details.each do |order_detail|
	        if order_detail.status != "d"
		# 	if @order_detail.order.order_details.all?{|order_detail| order_detail.status == 'd'}#"製作完了"}
				 is_updated = false
				end
			end
			  @order_detail.order.update(status: 'd') if is_updated
				# @order_detail.order.update(status: 'd')  #"発送準備中"
		end
		redirect_to edit_admin_order_path(@order_detail.order.id)
  end

  # 注文ステータスが「入金確認」になったら紐づく製作ステータス全てを「製作待ち」に自動更新
    def status_is_deposited?(order)
      if order.status_before_type_cast == 'b'
        order.orders.each do |p|
          p.update(order_status: 'b')
        end
        # flash[:info] = "製作ステータスが「製作待ち」に更新されました"
      end
    end

  # 製作ステータスが全部「製作完了」になったら注文ステータスが「発送準備中」に自動更新
    def status_is_production_complete?(order)
      if  order.order_details.all? do |p|
            p.status_before_type_cast == 'd'
          end
        order.order.update(status: 'd')
        flash[:success] = "注文ステータスが「発送準備中」に更新されました"
      end
    end

  # 製作ステータスが一つでも「製作中」になったら注文ステータスが「製作中」に自動更新
    def status_is_in_production?(order)
      if order.status_before_type_cast == 'c'
        # order.order.update(status: 'c')
        flash[:success] = "注文ステータスが「製作中」に更新されました"
      end
    end

  def destroy
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:price_tax, :amount, :status)
  end


end
