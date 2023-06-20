class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.integer :customer_id, null: false
      t.string :address, null: false
      t.string :addressed_name, null: false
      t.string :post_code, null: false
  
      t.timestamps
    end
  end
end
