class CartController < ApplicationController
  include NotificationModule

  before_action :authenticate_user!
  before_action :find_order_item

  def show
    @order_items = current_order.order_items if current_order.incart?
    @order = current_order
  end

  def checkout
    @order_items = current_order.order_items
    @order = current_order
  end

  def update_status
    current_order.update(status: :unconfirmed) if current_order.incart?
    create_notification(current_user.id, User.find_by(role: :admin).id, "update_status")
    redirect_to order_path(params[:id])
  end

  def order
    @order =Order.find params[:id]
  end

  def list_order
    @orders = Order.where(user_id: current_user).not_incart.paginate(page: params[:page], per_page: 8).order("created_at DESC")
  end

  def delete_all
    current_order.order_items.destroy_all
    redirect_to cart_path
  end

  def destroy
    order = Order.find params[:order_id].to_i
    order.order_items.destroy_all
    order.destroy
    flash[:success] = "Order cancel successfully"
    redirect_to items_path
  end

  private
    def find_order_item
      @order_items = current_order.order_items
    end
end

