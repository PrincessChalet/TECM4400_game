class RemoveGameidFromGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :game_id, :integer
  end
end
