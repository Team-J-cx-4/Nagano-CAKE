class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :id
      t.interger :member_id
      t.string :post_code
      t.string :address
      t.string :adressed_name
      t.interger :status
      t.interger :billing_price
      t.interger :payment_method
      t.interger :postage
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
