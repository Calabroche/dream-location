class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.date :starts_at
      t.date :ends_at

      t.timestamps
    end
  end
end
