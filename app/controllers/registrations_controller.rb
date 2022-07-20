class RegistrationsController < Devise::RegistrationsController

  def create
    super
    flash[:warning] = "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."
  end
end
