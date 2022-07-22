# frozen_string_literal: true

module Admin
  class ManageController < ApplicationController
    include NotificationModule

    def order
      @orders = Order.where(status: :unconfirmed).order("created_at DESC")
    end

    def confirm_all
      orders = Order.where(status: :unconfirmed)
      return unless orders.update(status: :confirmed)

      orders.each do |order|
        create_notification(current_user.id, order.user_id, "confirm_order")
      end
      redirect_to admin_dashboard_path
    end

    def confirm_order
      order = Order.find params[:id]
      return unless order.update(status: :cancelled)

      create_notification(current_user.id, order.user_id, "confirm_order")
      redirect_to admin_dashboard_path
    end

    def cancel_order
      order = Order.find params[:id]
      return unless order.update(status: :cancelled)

      create_notification(current_user.id, order.user_id, "cancel_order")
      redirect_to admin_dashboard_path
    end

    def confirm_multiple
      order_ids = params[:order_ids].split(",").map(&:to_i)
      orders = Order.where(id: order_ids)
      orders.update(status: :confirmed)
      orders.each do |order|
        create_notification(current_user.id, order.user_id, "confirm_order")
      end
    end

    def cancel_multiple
      order_ids = params[:order_ids].split(",").map(&:to_i)
      orders = Order.where(id: order_ids)
      orders.update(status: :cancelled)
      orders.each do |order|
        create_notification(current_user.id, order.user_id, "confirm_order")
      end
    end

    def manage_user
      @users = User.user.paginate(page: params[:page], per_page: 6).order("created_at DESC")
    end

    def destroy_user
      user = User.find(params[:id])
      user.destroy
      redirect_to admin_manage_user_path
    end

    def dashboard
      @orders = Order.where(status: :unconfirmed).paginate(page: params[:page], per_page: 8).order("created_at DESC")
    end

    def list_order
      @orders = Order.where(status: :confirmed).paginate(page: params[:page], per_page: 8).order("created_at DESC")
    end
  end
end
