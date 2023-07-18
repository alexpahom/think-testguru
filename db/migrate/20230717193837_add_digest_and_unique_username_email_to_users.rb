class AddDigestAndUniqueUsernameEmailToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |table|
      table.column :password_digest, :string
      table.column :username, :string
      table.index :email, unique: true
      table.index :username, unique: true
    end
  end
end
