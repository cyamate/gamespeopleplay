class AddOwnedtoExpansions < ActiveRecord::Migration[5.2]
  def change
  	add_column :expansions, :owned, :integer
  end
end
