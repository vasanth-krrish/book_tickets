class AddIndexToMovieCasts < ActiveRecord::Migration[6.0]
  def change
    add_index :movie_casts, [:movie_id, :person_id], unique: true
  end
end
