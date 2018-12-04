class AddCatageoryToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :catageory, :text
  end
end
