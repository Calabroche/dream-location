class AddImgUrlToDream < ActiveRecord::Migration[7.0]
  def change
    add_column :dreams, :img_url_one, :text
    add_column :dreams, :img_url_two, :text
    add_column :dreams, :img_url_three, :text
    add_column :dreams, :img_url_four, :text
    add_column :dreams, :img_url_five, :text
  end
end
