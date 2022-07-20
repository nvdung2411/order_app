# frozen_string_literal: true

class Item < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :category
  has_many :order_items
  has_many :reviews
  has_one_attached :image
  validates :name, :description, :price, presence: true
end
