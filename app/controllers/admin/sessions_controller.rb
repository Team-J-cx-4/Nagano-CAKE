class Admin::SessionsController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
  end

  def create
  end

  def destroy
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
