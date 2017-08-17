class ChangeSupplierColumnToSupplierId < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :supplier, :supplier_id
  end
end
