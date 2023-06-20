class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false
      t.string :first_name_kana, null: false
      t.string :post_code, null: false
      t.string :address, null: false
      t.string :phone_number, null: false
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.boolern :is_deleted, null: false, default: false
      t.timestamps
    end
  end
end
