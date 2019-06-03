class CreateLobbies < ActiveRecord::Migration[5.2]
  def change
    create_table :lobbies do |t|
      t.boolean :active
      t.boolean :competitive

      t.timestamps
    end
  end
end
