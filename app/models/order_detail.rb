class OrderDetail < ApplicationRecord
  enum status: { a: 0, b: 1, c: 2, d: 3 }
end
