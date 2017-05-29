class AddAndroidAuthTokenAndWebAuthTokenToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :android_auth_token, :string
    add_column :users, :web_auth_token, :string
  end
end
