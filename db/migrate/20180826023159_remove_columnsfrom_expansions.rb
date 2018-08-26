class RemoveColumnsfromExpansions < ActiveRecord::Migration[5.2]
  def change
  	remove_column :expansions, :publisher_id, :integer
  	remove_column :expansions, :designer_id, :integer
  	remove_column :expansions, :game_id, :integer
  	remove_reference :expansions, :designer, index: true
  end
end
