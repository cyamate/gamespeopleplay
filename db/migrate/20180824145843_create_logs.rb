class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.date :date
      t.integer :game_id
      t.integer :expansion_id
      t.integer :pcount
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
