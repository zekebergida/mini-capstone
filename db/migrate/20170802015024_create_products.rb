class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.integer :price
      t.string :description

      t.timestamps
    end
  end
end
