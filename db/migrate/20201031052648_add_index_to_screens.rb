class AddIndexToScreens < ActiveRecord::Migration[6.0]
  def change
    add_index :screens, [:theatre_id, :name], unique: true
  end
end
