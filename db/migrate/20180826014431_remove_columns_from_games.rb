class RemoveColumnsFromGames < ActiveRecord::Migration[5.2]
  def change
  	remove_column :games, :publisher_id, :integer
  	remove_column :games, :designer_id, :integer
  	remove_reference :games, :designer, index: true
  end
end
