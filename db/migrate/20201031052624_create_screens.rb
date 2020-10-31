class CreateScreens < ActiveRecord::Migration[6.0]
  def change
    create_table :screens do |t|
      t.string :name
      t.integer :seats
      t.references :theatre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
