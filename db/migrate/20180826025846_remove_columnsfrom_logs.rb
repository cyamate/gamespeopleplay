class RemoveColumnsfromLogs < ActiveRecord::Migration[5.2]
  def change
  	remove_column :logs, :expansion_id, :integer
  end
end
