# frozen_string_literal: true

module ApplicationHelper
  def current_order
    if Order.incart.find_by(id: session[:order_id]).nil?
      Order.new
    else
      Order.find_by(id: session[:order_id])
    end
  end

  def item_in_cart
    current_order.order_items
  end

  def hiden_navbar
    "#{controller_name}/#{action_name}" == "manage/dashboard"
  end
end
