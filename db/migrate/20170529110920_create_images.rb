class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :path_to_image
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
