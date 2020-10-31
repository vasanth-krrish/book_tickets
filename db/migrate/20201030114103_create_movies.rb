class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.text :synopsis
      t.date :premiere
      t.integer :runtime

      t.timestamps
    end
  end
end
