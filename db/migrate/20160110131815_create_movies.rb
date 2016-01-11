class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :director
      t.text :info
      t.integer :effect_rating
      t.references :mood, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
