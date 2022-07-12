class RemoveColumnsInItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :item_img_file_name
    remove_column :items, :item_img_content_type
    remove_column :items, :item_img_file_size
    remove_column :items, :item_img_updated_at
  end
end
