class AlterMessageIdInPhoto < ActiveRecord::Migration
  def change
    remove_column :photos, :message_id
    add_column :photos, :message_id, :integer
  end
end
