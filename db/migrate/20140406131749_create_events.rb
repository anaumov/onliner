class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :photo
      t.timestamps
    end

    add_column :onlines, :event_id, :integer
    add_index :onlines, :event_id
  end
end
