class CartController < ApplicationController
  def show
    @order_items = current_order.order_items
  end

  def checkout
  	@order_items = current_order.order_items
  end

end
