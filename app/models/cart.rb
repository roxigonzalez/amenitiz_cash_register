class Cart < ApplicationRecord
  has_and_belongs_to_many :products
  
  validates :total, presence: true
  validates :total, numericality: {
    greater_than: 0
  }
end
