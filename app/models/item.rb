class Item < ApplicationRecord
  belongs_to :category
  validates :name, :description, :price, :category_id, presence: true

  has_attached_file :item_img, :styles => { :item_index => "250x350>",
   :iem_show => "325x475>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :item_img, :content_type => /\Aimage\/.*\Z/

end
