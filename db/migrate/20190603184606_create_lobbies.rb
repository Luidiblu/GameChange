class CreateLobbies < ActiveRecord::Migration[5.2]
  def change
    create_table :lobbies do |t|
      t.boolean :active, default: true
      t.boolean :competitive

      t.timestamps
    end
  end
end
