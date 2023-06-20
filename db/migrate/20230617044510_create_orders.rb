class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :member_id, null: false
      t.string :post_code, null: false
      t.string :address, null: false
      t.string :adressed_name, null: false
      t.integer :status, null: false, default: 0
      t.integer :billing_price, null: false
      t.integer :payment_method, null: false, default: 0
      t.integer :postage, null: false
      t.timestamps
    end
  end
end
