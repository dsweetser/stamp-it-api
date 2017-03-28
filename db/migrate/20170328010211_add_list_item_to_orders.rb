class AddListItemToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :list_item, foreign_key: true
  end
end
