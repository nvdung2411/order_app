class Admin::ManageController < ApplicationController

  def order
      @order_items = OrderItem.joins(:order).where('orders.status = 0')
  end

  def manage_user
     @user = User.select {|user| user.admin == false }
  end
end
