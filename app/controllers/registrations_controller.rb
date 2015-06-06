class RegistrationsController < Devise::RegistrationsController
  protected

  # we override the redirection path after a user edit his profile
  def after_update_path_for resource
    users_path
  end


  private
 
  # cf http://www.jacopretorius.net/2014/03/adding-custom-fields-to-your-devise-user-model-in-rails-4.html
  # we must override some devise methods
  # in order to allow our custom parameters such as first_name or last_name:

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
 
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end
end