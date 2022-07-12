class Admin::ManageController < ApplicationController

  def order
    @orders = Order.where(status: :unconfirmed).paginate(page: params[:page], per_page: 8).order("created_at DESC")
  end

  def confirm_order
    order = Order.find params[:id]
    if order.update(status: :confirmed)
      redirect_to admin_order_path
    end
  end

  def cancelled_order
    order = Order.find params[:id]
    if order.update(status: :cancelled)
      redirect_to admin_order_path
    end
  end

  def manage_user
    @user = User.select {|user| user.admin == false }
  end

  def destroy_user
    @user =User.find(params[:id])
    @user.destroy
    redirect_to admin_manage_user_path
  end
end
