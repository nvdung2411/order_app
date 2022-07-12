class Item < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :category
  has_many :order_items
  has_one_attached :image
  validates :name, :description, :price, :category_id, presence: true
end
