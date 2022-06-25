class AddAttachmentItemImgToItems < ActiveRecord::Migration[6.0]
  def self.up
    change_table :items do |t|
      t.attachment :item_img
    end
  end

  def self.down
    remove_attachment :items, :item_img
  end
end
