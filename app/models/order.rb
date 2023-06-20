class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { a: 0, b: 1, c: 2, d: 3, e: 4 }
end
