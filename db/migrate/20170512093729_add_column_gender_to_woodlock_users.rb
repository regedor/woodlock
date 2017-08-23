class AddColumnGenderToWoodlockUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :woodlock_users, :gender, :string
  end
end
