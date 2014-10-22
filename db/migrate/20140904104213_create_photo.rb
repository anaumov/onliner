class CreatePhoto < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :file, null: false
      t.integer :message_id, null: false
      t.integer :online_id, null: false
      t.timestamps
    end

    add_index :photos, :message_id
    add_index :photos, :online_id
  end
end
