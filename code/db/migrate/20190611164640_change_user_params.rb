class ChangeUserParams < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :provider
    remove_column :users, :oauth_token
    remove_column :users, :oauth_expires_at
    add_column :users, :email, :string
  end

  def down
    add_column :users, :provider, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expires_at, :datetime
    remove_column :users, :email 
  end
end
