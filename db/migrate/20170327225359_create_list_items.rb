# frozen_string_literal:true

class CreateListItems < ActiveRecord::Migration[5.0]
  def change
    create_table :list_items do |t|
      t.references :stamps, foreign_key: true
      t.references :orders, foreign_key: true

      t.timestamps
    end
  end
end
