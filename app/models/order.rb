class Order < ApplicationRecord
	enum status: { unconfirmed: 0, placed: 1, cancelled: 2, confirmed: 3 }
	belongs_to :user, optional: true
  has_many :order_items
  before_save :set_subtotal
  delegate :name, :email, :phone, :delivery_address, to: :user,  allow_nil: true, prefix: true

  def subtotal
    order_items.collect { |order_item| order_item.valid? ? order_item.unit_price * order_item.quantity : 0 }.sum
  end

  private

  def set_subtotal
    self[:subtotal] = subtotal
  end
end
