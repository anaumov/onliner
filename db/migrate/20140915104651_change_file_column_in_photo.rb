class ChangeFileColumnInPhoto < ActiveRecord::Migration
  def change
    change_column :photos, :file, :string, :null => true
  end
end
