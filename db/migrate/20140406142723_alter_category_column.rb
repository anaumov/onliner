class AlterCategoryColumn < ActiveRecord::Migration
  def change
    remove_column :onlines, :category_id
  end
end
