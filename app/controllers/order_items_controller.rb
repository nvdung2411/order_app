class OrderItemsController < ApplicationController
  before_action :set_order

  def create
    @order.user_id = current_user.id
    @order.save
    @order_item = @order.order_items.find_or_initialize_by(item_id: order_params[:item_id])

    if @order_item.persisted?
      @order_item.quantity += order_params[:quantity].to_i
    else
      @order_item.quantity = order_params[:quantity]
      @order_item.user_id = order_params[:user_id]
    end
    @order_item.user_id = current_user.id
    @order_item.save
    session[:order_id] = @order.id
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_params)
    @order_items = current_order.order_items.includes(:item, :user)
  end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = current_order.order_items
  end

  private

  def order_params
    params.require(:order_item).permit(:item_id, :quantity, :user_id)
  end

  def set_order
    @order = current_order
  end
end
