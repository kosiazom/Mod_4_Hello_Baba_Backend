class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :reviews, :review_id
  end
end
