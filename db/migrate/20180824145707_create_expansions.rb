class CreateExpansions < ActiveRecord::Migration[5.2]
  def change
    create_table :expansions do |t|
      t.string :name
      t.integer :pcount
      t.integer :year
      t.integer :designer_id
      t.integer :publisher_id
      t.integer :game_id
      t.references :publisher, foreign_key: true
      t.references :designer, foreign_key: true
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
