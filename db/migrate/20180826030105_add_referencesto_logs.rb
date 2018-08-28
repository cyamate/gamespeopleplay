class AddReferencestoLogs < ActiveRecord::Migration[5.2]
  def change
  	add_reference :expansions, :publisher, index: true

  end
end
