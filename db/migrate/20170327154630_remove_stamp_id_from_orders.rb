class RemoveStampIdFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :stamp_id, :integer
  end
end
