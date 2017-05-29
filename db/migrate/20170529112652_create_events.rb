class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.boolean :private

      t.timestamps
    end
  end
end
