class CreateOnline < ActiveRecord::Migration
  def change
    create_table :onlines do |t|
      t.string :title, null: false
      t.text :description
      t.string :photo
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.timestamps
    end

    add_index :onlines, :user_id
    add_index :onlines, :category_id
  end
end
