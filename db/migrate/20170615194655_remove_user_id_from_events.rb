class RemoveUserIdFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :user_id, :integer
  end
end
