class AddColumnFirstNameAndLastNameToWoodlockUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :woodlock_users, :first_name, :string
    add_column :woodlock_users, :last_name, :string
  end
end
