class Admin::ManageController < ApplicationController
  include NotificationModule

  def order
    @orders = Order.where(status: :unconfirmed).paginate(page: params[:page], per_page: 8).order("created_at DESC")
  end

  def confirm_all
    orders = Order.where(status: :unconfirmed)
    if orders.update(status: :confirmed)
      orders.each do |order|
        create_notification(current_user.id, order.user_id, "confirm_order")
      end
      redirect_to admin_order_path
    end
  end

  def confirm_order
    order = Order.find params[:id]
    if order.update(status: :confirmed)
      create_notification(current_user.id, order.user_id, "confirm_order")
      redirect_to admin_order_path
    end
  end

  def cancel_order
    order = Order.find params[:id]
    if order.update(status: :cancelled)
      create_notification(current_user.id, order.user_id, "cancel_order")
      redirect_to admin_order_path
    end
  end

  def confirm_multiple
    order_ids = params[:order_ids].split(',').map(&:to_i)
    orders = Order.where(id: order_ids)
    orders.update(status: :confirmed)
    orders.each do |order|
      create_notification(current_user.id, order.user_id, "confirm_order")
    end
  end

  def cancel_multiple
    order_ids = params[:order_ids].split(',').map(&:to_i)
    orders = Order.where(id: order_ids)
    orders.update(status: :cancelled)
    orders.each do |order|
      create_notification(current_user.id, order.user_id, "confirm_order")
    end
  end

  def manage_user
    @user = User.select {|user| user.admin! }
  end

  def destroy_user
    user =User.find(params[:id])
    user.destroy
    redirect_to admin_manage_user_path
  end
end

