class AddAccessCodeToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :access_code, :string
  end
end
