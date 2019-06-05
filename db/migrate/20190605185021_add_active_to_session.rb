class AddActiveToSession < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :active, :boolean
  end
end
