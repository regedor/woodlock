class AddFacebookPhotoUrlAndGooglePhotoUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook_photo_url, :string
    add_column :users, :google_photo_url, :string
  end
end
