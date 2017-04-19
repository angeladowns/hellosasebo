class AddCategoryToAdventures < ActiveRecord::Migration[5.0]
  def change
    add_column :adventures, :category_id, :int
  end
end
