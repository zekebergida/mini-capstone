class ChangePriceToDecimal < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :price, "numeric USING CAST(price AS numeric)"
    change_column :products, :price, :decimal, precision: 7, scale: 2
  end
end
