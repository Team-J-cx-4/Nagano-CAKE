class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :id
      t.integer :item_id
      t.integer :order_id
      t.integer :price_tax
      t.integer :amount
      t.integer :status
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
