class CartController < ApplicationController
  before_action :authenticate_user!
  before_action :find_order_item

  def show
    if current_order.confirmed?
      @order_items.update(status: :placed)
    end
    @order_items = @order_items.includes([:item]).where(status: :unconfirmed)
  end

  def checkout
    @order_items = @order_items.where(status: :unconfirmed)
  end

  def order
    @order = Order.where(user_id: current_user).order("created_at DESC")
  end

  def destroy
    order = Order.find params[:order_id]
    OrderItem.where(order_id: params[:order_id]).destroy_all
    order.destroy
    redirect_to order_path
  end

  private
    def find_order_item
      @order_items = current_order.order_items
    end
end
