class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :code, presence: true
  validates :price, numericality: {
    greater_than: 0
  }

  validates_length_of :name, maximum: 100
end
