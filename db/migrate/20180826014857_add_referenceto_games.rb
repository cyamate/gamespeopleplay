class AddReferencetoGames < ActiveRecord::Migration[5.2]
  def change
  	add_reference :games, :publisher, index: true
  end
end
