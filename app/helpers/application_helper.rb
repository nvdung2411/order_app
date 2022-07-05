module ApplicationHelper

  def current_order
    if Order.unconfirmed.find_by_id(session[:order_id]).nil?
      Order.new
    else
      Order.find_by_id(session[:order_id])
    end
  end

  def item_in_cart
    current_order.order_items.where(status: :unconfirmed)
  end
end
