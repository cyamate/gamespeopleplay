class RemoveIDcolumns < ActiveRecord::Migration[5.2]
  def change
  	remove_column :expansions, :publisher_id, :integer
  end
end
