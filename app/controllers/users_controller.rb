class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) if params[:id].to_i <= User.last.id
    redirect_to user_path(current_user) if @user != current_user
  end
end
