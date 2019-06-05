class AddPhotoToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :banner_img, :string
    add_column :users, :avatar, :string
  end
end
