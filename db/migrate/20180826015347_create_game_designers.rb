class CreateGameDesigners < ActiveRecord::Migration[5.2]
  def change
    create_table :game_designers do |t|
      t.references :game, foreign_key: true
      t.references :designer, foreign_key: true

      t.timestamps
    end
  end
end
