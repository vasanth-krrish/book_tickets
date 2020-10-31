class AddIndexToMovieTimings < ActiveRecord::Migration[6.0]
  def change
    add_index :movie_timings, [:movie_id, :timing_id], unique: true
  end
end
