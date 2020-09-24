class ChangeColumnType < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :review_id, 'integer USING CAST(review_id AS integer)'
 

  end
end
