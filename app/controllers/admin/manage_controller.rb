class Admin::ManageController < ApplicationController

  def order
    @order_items = OrderItem.includes(:user, :item, :order).joins(:order).where('orders.status = 0')
  end

  def update_status
    order = Order.find params[:id]
    if order.update(status: :confirmed)
      redirect_to admin_order_path
    end
  end

  def manage_user
    @user = User.select {|user| user.admin == false }
  end
end
