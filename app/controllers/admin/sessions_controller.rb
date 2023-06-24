class Admin::SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    admin_path
  end

  def after_sign_out_path_for(resource)
    admin_session_path
  end
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # def new
  # end

  # # def create
  # #   @admin= sign_in(params[:email], params[:password])
  # #   if @admin
  # #     redirect_to admin_path, success: 'ログインしました'
  # #   else
  # #     flash.now[:danger] = 'ログインに失敗しました'
  # #     render :new
  # #   end
  # # end

  # def destroy
  #   redirect_to destroy_admin_session_path, success: 'ログアウトしました'
  # end

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  # end
end
