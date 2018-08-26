class CreateExpansionDesigners < ActiveRecord::Migration[5.2]
  def change
    create_table :expansion_designers do |t|
      t.references :expansion, foreign_key: true
      t.references :designer, foreign_key: true

      t.timestamps
    end
  end
end
