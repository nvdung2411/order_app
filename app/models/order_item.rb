class OrderItem < ApplicationRecord
	enum status: { Unconfirmed: 0, Placed: 1, Cancelled: 2, Confirmed: 3 }
  belongs_to :item
  belongs_to :order
  belongs_to :user
  before_save :set_unit_price
  before_save :set_total

  delegate :name, :email, :phone, :delivery_address, to: :user,  allow_nil: true, prefix: true

  def unit_price
    # If there is a record
    if persisted?
      self[:unit_price]
    else
      item.price
    end
  end

  def total
    unit_price * quantity
  end

  private

  def set_unit_price
    self[:unit_price] = unit_price
  end

  def set_total
    self[:total] = total * quantity
  end
end
