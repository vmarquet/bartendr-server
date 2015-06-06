class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    # if the parameter 'approved=false' is given in the query parameters (/users?approved=false),
    # we display an info message even if all users have been accepted by another bartender
    # if this query parameter is not set, the info message on the /users page will be shown
    # only if there are user waiting approval, and nothing will appear if all users have been approved
    # (we just check if the parameter is given, actually, we don't care about the value)
    if params[:approved] != nil
      @show_message_even_if_all_user_approved = true
    end

    @users_not_approved = User.where(["approved = ?", false])
    @users = User.where(["approved = ?", true])
  end

  def approve
    user = User.find(params[:id])
    user.approved = true
    user.save

    respond_to do |format|
      user_name = user.first_name + ' ' + user.last_name
      format.html { redirect_to users_path, notice: user_name + ' was approved, he has barman rights now.' }
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    respond_to do |format|
      user_name = user.first_name + ' ' + user.last_name
      format.html { redirect_to users_path, notice: 'User "' + user_name + '" was successfully deleted.' }
    end
  end
end
