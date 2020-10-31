class AddIndexToMovieCrews < ActiveRecord::Migration[6.0]
  def change
    add_index :movie_crews, [:movie_id, :person_id], unique: true
  end
end
