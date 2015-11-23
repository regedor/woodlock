class AddGithubPhotoUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :github_photo_url, :string
  end
end
