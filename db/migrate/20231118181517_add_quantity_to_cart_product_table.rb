class AddQuantityToCartProductTable < ActiveRecord::Migration[7.1]
  def change
    add_column :carts_products, :quantity, :integer, default: 1
  end
end
