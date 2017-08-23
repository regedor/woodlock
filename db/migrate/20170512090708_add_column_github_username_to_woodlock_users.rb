class AddColumnGithubUsernameToWoodlockUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :woodlock_users, :github_username, :string
  end
end
