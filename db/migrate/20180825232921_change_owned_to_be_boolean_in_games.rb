class ChangeOwnedToBeBooleanInGames < ActiveRecord::Migration[5.2]
  def change
  	change_column :games, :owned, :boolean
  end
end
