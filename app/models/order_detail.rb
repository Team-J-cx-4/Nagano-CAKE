class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum status: { a: 0, b: 1, c: 2, d: 3 }

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
      order = Order.new(order_params)
    order.save
    @cart_items = current_end_user.cart_items.all

    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = order.id
      @order_details.item_id = cart_item.item.id
      @order_details.price = cart_item.item.price_excluding_tax
      @order_details.number = cart_item.amount
      @order_details.manufacture_status = 0
      @order_details.save!
    end
  end

  def with_tax_price
    (price * 1.1).floor
  end

  def subtotal
    item.with_tax_price * amount
  end

  after_update do
    order_details = self.order.order_details
    if order_details.any? {|order_detail| order_detail.item_status == "製作中"} == true # 条件分岐：製作ステータスが1つでも製作中にだったら
      self.order.update(order_status: "製作中") # 注文ステータスを製作中に変更する
    elsif order_details.all? {|order_detail| order_detail.item_status == "製作完了"} == true # 条件分岐：製作ステータスが全て製作完了だったら
    self.order.update(order_status: "発送準備中") # 注文ステータスを発送準備中に変更する
    end
  end
end
