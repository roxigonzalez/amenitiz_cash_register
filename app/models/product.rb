class Product < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :price, presence: true
  validates :code, presence: true
  validates :price, numericality: {
    greater_than: 0
  }
end
