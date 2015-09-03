class AddGenderAndPhotoUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :photo_url, :string
  end
end
