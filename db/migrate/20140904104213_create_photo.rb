class CreatePhoto < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :file
      t.belongs_to :message
      t.belongs_to :online
      t.belongs_to :event
      t.timestamps
    end
  end
end
