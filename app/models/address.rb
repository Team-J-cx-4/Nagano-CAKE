class Address < ApplicationRecord
  belongs_to :customer
  def address_display
  '〒' + post_code + ' ' + address + ' ' + addressed_name
  end
end
