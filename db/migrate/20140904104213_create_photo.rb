class CreatePhoto < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :file, null: false
      t.belongs_to :message, null: false
      t.belongs_to :online, null: false
      t.belongs_to :event, null: false
      t.timestamps
    end
    add_index :photos, :message_id
    add_index :photos, :online_id
    add_index :photos, :event_id
  end
end
