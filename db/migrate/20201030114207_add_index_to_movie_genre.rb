class AddIndexToMovieGenre < ActiveRecord::Migration[6.0]
  def change
    add_index :movie_genres, [:movie_id, :genre_id], unique: true
  end
end
