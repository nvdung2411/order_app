class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
  belongs_to :user
  before_save :set_unit_price
  before_save :set_total

  delegate :name, :email, :phone, :delivery_address, to: :user,  allow_nil: true, prefix: true

  private

  def set_unit_price
    self[:unit_price] = persisted? ? self[:unit_price] : item.price
  end

  def set_total
    self[:total] = unit_price * quantity
  end
end
