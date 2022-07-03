class ApplicationController < ActionController::Base
	require 'will_paginate/array'

  include ApplicationHelper
  skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone, :name, :delivery_address])
  end

end
