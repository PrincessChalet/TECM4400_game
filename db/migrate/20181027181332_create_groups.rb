class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :experience_level
      t.integer :user_id
      t.integer :event_id
      t.integer :game_id
      t.datetime :create_date

      t.timestamps
    end
  end
end
