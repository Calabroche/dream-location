class AddInformationsToDreams < ActiveRecord::Migration[7.0]
  def change
    add_column :dreams, :number_street, :integer
    add_column :dreams, :name_street, :string
    add_column :dreams, :post_code, :string
    add_column :dreams, :city, :string
  end
end
