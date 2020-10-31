class CreateMovieCasts < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_casts do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.string :character

      t.timestamps
    end
  end
end
