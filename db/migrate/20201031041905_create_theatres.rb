class CreateTheatres < ActiveRecord::Migration[6.0]
  def change
    create_table :theatres do |t|
      t.string :name
      t.text :address
      t.string :city
      t.string :state
      t.string :pincode

      t.timestamps
    end
  end
end
