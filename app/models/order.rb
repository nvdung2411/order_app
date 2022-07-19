class Order < ApplicationRecord
	enum status: { incart: 0, unconfirmed: 1, placed: 2, cancelled: 3, confirmed: 4 }
	belongs_to :user, optional: true
  has_many :order_items
  before_save :set_subtotal
  delegate :name, :email, :phone, :delivery_address, to: :user,  allow_nil: true, prefix: true

  def subtotal
    order_items.includes(:item, :user).collect { |order_item| order_item.valid? ? order_item.unit_price * order_item.quantity : 0 }.sum
  end

  private

  def set_subtotal
    self[:subtotal] = subtotal
  end
end
