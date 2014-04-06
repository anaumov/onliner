class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body
      t.integer :user_id
      t.integer :online_id
      t.timestamps
    end

    add_index :messages, :user_id
    add_index :messages, :online_id
  end
end
