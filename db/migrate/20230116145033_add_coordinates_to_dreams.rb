class AddCoordinatesToDreams < ActiveRecord::Migration[7.0]
  def change
    add_column :dreams, :latitude, :float
    add_column :dreams, :longitude, :float
  end
end
