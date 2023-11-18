class CreateCarts < ActiveRecord::Migration[7.1]
  def change
    create_table :carts do |t|
      t.decimal :total, precision: 10, scale: 2, null: false
      t.decimal :discount, precision: 10, scale: 2, default: 0
      t.timestamps
    end
  end
end
