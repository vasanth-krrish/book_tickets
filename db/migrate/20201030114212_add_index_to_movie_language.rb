class AddIndexToMovieLanguage < ActiveRecord::Migration[6.0]
  def change
    add_index :movie_languages, [:movie_id, :language_id], unique: true
  end
end
