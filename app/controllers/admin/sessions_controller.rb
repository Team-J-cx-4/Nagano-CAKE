class Admin::SessionsController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def new
  end

  def create
    @admin= login(params[:email], params[:password])
    if @admin
      redirect_to admin_root_path, success: 'ログインしました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    logout
    redirect_to admin_login_path, success: 'ログアウトしました'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
