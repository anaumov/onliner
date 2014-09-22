class ChangeMessageColumnInPhotos < ActiveRecord::Migration
  def change
    change_column :photos, :message_id, :integer, :null => true
  end
end
