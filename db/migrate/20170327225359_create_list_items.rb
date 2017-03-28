# frozen_string_literal:true

class CreateListItems < ActiveRecord::Migration[5.0]
  def change
    create_table :list_items do |t|
      t.references :stamp, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
