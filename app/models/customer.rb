class Customer < ApplicationRecord
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
# validates :name, :login, :email, presence: true
  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, presence: true

end