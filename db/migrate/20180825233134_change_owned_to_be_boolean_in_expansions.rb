class ChangeOwnedToBeBooleanInExpansions < ActiveRecord::Migration[5.2]
  def change
  	change_column :expansions, :owned, :boolean
  end
end
