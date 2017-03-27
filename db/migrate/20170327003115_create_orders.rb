# frozen_string_literal:true

class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :stamp_id
      t.boolean :paid
      t.string :shipping_address
      t.integer :total
      t.string :billing_address

      t.timestamps
    end
  end
end
