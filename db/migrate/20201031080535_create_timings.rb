class CreateTimings < ActiveRecord::Migration[6.0]
  def change
    create_table :timings do |t|
      t.references :screen, null: false, foreign_key: true
      t.string :timing

      t.timestamps
    end
  end
end
