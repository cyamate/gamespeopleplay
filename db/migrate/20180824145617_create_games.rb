class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :pcount
      t.integer :year
      t.integer :designer_id
      t.integer :publisher_id
      t.references :designer, foreign_key: true
      t.references :publisher, foreign_key: true

      t.timestamps
    end
  end
end
