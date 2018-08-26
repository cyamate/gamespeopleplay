class AddReferencetoExpansions < ActiveRecord::Migration[5.2]
  def change
  	add_reference :expansions, :publisher, index: true
  	add_reference :expansions, :game, index: true
  end
end
