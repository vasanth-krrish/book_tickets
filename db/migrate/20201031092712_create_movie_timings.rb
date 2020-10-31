class CreateMovieTimings < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_timings do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :timing, null: false, foreign_key: true
      t.date :screening_till
      t.integer :price_cents

      t.timestamps
    end
  end
end
