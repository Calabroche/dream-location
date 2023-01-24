class AddDreamToLocations < ActiveRecord::Migration[7.0]
  def change
    add_reference :locations, :dream, null: false, foreign_key: true
  end
end
