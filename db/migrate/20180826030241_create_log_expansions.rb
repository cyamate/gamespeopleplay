class CreateLogExpansions < ActiveRecord::Migration[5.2]
  def change
    create_table :log_expansions do |t|
      t.references :log, foreign_key: true
      t.references :expansion, foreign_key: true

      t.timestamps
    end
  end
end
