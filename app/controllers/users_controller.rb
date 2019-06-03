class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_user, only: %i[show]

  def show
   #return @user if params[:id].to_i <= User.last.id
    #redirect_to user_path(current_user) if @user != current_user

  end


  private

  def set_user
      @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :nickname, :banner_img, :avatar)
  end
end
