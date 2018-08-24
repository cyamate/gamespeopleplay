class CreatePlayerScores < ActiveRecord::Migration[5.2]
  def change
    create_table :player_scores do |t|
      t.integer :player_id
      t.integer :log_id
      t.integer :score
      t.references :player, foreign_key: true
      t.references :log, foreign_key: true

      t.timestamps
    end
  end
end
