class HomepageController < ApplicationController

  def home
    @items = Item.first(6)
    @order_item = current_order.order_items.new
  end

  def about
  end
end
