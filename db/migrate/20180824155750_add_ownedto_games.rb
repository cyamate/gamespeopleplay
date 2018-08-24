class AddOwnedtoGames < ActiveRecord::Migration[5.2]
  def change
  	add_column :games, :owned, :integer
  end
end
