class AddRegionsToDream < ActiveRecord::Migration[7.0]
  def change
    add_column :dreams, :regions, :text
  end
end
