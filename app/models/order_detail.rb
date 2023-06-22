class OrderDetail < ApplicationRecord
  enum status: { a: 0, b: 1, c: 2, d: 3 }

  def with_tax_price
    (price * 1.1).floor
  end

  def subtotal
    item.with_tax_price * amount
  end
end
