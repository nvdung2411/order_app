class OrderItem < ApplicationRecord
	enum status: { In_Progress: 0, Unconfirmed: 1, Placed: 2, Cancelled: 3 }
  belongs_to :item
  belongs_to :order
  before_save :set_unit_price
  before_save :set_total

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
