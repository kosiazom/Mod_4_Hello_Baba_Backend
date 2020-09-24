class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.integer :stock
      t.string :product_img
      t.integer :category_id
      t.integer :review_id

      t.timestamps
    end
  end
end
