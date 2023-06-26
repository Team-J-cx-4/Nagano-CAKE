class Order < ApplicationRecord
  belongs_to :customer
	has_many   :order_details, dependent: :destroy
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { a: 0, b: 1, c: 2, d: 3, e: 4 }
  after_update do
    if self.order_status == "入金確認"
      self.order_details.each {|order_detail|
      order_detail.update(item_status: "製作待ち")
      }
    end
  end

end
