module ApplicationHelper

  def current_order
    if Order.incart.find_by_id(session[:order_id]).nil?
      Order.new
    else
      Order.find_by_id(session[:order_id])
    end
  end

  def item_in_cart
    current_order.order_items
  end
end
