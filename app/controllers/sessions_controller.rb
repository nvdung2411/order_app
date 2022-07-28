# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  # def create
  #   super
  #   flash[:success] = "Signed in successfully."
  # end

  def destroy
    super
    flash[:success] = "Signed out successfully."
  end
end
