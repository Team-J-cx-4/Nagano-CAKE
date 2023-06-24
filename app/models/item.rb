class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :genre
  has_many :cart_item, dependent: :destroy
  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true
  validates :is_stated, presence: true
end
