class AddUsernameAndTelNumberToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :tel_number, :string
  end
end
