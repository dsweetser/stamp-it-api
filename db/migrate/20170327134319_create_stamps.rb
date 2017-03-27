class CreateStamps < ActiveRecord::Migration[5.0]
  def change
    create_table :stamps do |t|
      t.references :order
      t.string :link
      t.string :monochrome_link
      t.integer :cost

      t.timestamps
    end
  end
end
