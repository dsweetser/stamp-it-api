class AddStampsToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :stamps, foreign_key: true
  end
end
