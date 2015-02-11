class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  	@users = User.where(["approved = ?", true])
  end

  def activate_accounts
    # @users = User.find_all_by_approved(false)
    # the previous line should work, but method 'find_all_by_approved' is not found
    # cf https://github.com/plataformatec/devise/wiki/How-To:-Require-admin-to-activate-account-before-sign_in
    # warning, there is maybe a bug somewhere

    # alternate way:
    @users = User.where(["approved = ?", false])
  end
end
