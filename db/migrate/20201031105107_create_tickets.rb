class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.references :movie_timing, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :price_cents
      t.integer :quantity

      t.timestamps
    end
  end
end
