class Cart < ApplicationRecord  
  validates :total, presence: true
  validates :total, numericality: {
    greater_than: 0
  }
end
