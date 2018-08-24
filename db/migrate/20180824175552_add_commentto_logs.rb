class AddCommenttoLogs < ActiveRecord::Migration[5.2]
  def change
  	add_column :logs, :comment, :text
  end
end
