class AddImageToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :image, :string
  end
end
