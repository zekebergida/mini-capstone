class AddSupplierToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :supplier, :integer
  end
end
