class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.integer :stock
      t.string :product_img
      t.innteger :category_id
      t.string :reviews

      t.timestamps
    end
  end
end
