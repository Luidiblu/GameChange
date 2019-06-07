class ProfileController < ApplicationController
  before_action :authenticate_profile!, except: %i[index show]
  before_action :set_profile, only: %i[show]

  def show
  end

  def create
  end

  def update
  end

  private

  def set_profile
    @user = User.find(params[:id])
  end

  def profile_params
    params.require(:user).permit(:name, :nickname, :banner_img, :avatar)
  end
end
