class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :name
      t.string :location
      t.integer :product_id

      t.timestamps
    end
  end
end
