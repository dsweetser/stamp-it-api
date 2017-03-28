class RemoveOrdersIdFromStamps < ActiveRecord::Migration[5.0]
  def change
    remove_column :stamps, :order_id, :references
  end
end
