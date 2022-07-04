class CartController < ApplicationController
  before_action :authenticate_user!
  before_action :find_order_item

  def show
    @order_items
  end

  def checkout
    @order_items

  end

  def order
    @order = current_order
  end

  def update_status
    order = Order.find params[:id]

    if order.update(status: :Confirmed)
      redirect_to order_path
    end
  end

  def destroy
    @order_items.destroy_all
    redirect_to order_path
  end

  private
    def find_order_item
      @order_items = current_order.order_items

    end
end
