class RemoveEventidFromGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :event_id, :integer
  end
end
