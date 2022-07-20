# frozen_string_literal: true

class ApplicationController < ActionController::Base
  require "will_paginate/array"

  include ApplicationHelper
  before_action :search
  skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[phone name delivery_address])
  end

  def search
    @search = Item.ransack(params[:q])
  end

  def after_sign_in_path_for(_resource)
    if current_user.admin?
      admin_dashboard_path
    else
      root_path
    end
  end

  def current_order
    if Order.incart.find_by(id: session[:order_id]).nil?
      Order.new
    else
      Order.find_by(id: session[:order_id])
    end
  end
end
