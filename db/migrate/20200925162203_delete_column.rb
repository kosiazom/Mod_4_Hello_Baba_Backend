class DeleteColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column(:products, :review_id)
  end
end
