class Order < ApplicationRecord
  belongs_to :customer
	has_many   :order_details, dependent: :destroy
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { a: 0, b: 1, c: 2, d: 3, e: 4 }
  after_update do
    if self.status == 'b'#"入金確認"
      self.order_details.each {|order_detail|
      order_detail.update(status: 'b')#"製作待ち")
      }
    end
  end

  def subtotal
    item.add_tax_price * amount
  end

end


# enum status: { payment_waiting: 0, payment_confirmation: 1, in_production: 2, preparing_delivery: 3, delivered: 4 }
#status　→　注文ステータス