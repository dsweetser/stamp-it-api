class AddListItemToStamps < ActiveRecord::Migration[5.0]
  def change
    add_reference :stamps, :list_item, foreign_key: true
  end
end
