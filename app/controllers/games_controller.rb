class GamesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_game, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @games = Game.search_by_name("%#{params[:query]}%")
    else
      @games = Game.all
    end
  end

  def new
    if current_user.admin?
      @game = Game.new
    else
      redirect_to games_path
    end
  end

  def show
      #
      # @id =  Game.find(params[:id])
      # @favorite = @id.favorites.new(current_user)
      # if @favorite.save
      # end

    @available = @game.lobbies.select { |l| l.max_players > l.sessions.where(active: true).count && l.active? }.count
    # raise
  end

  def edit; end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to @game
    else
      render :new

    end
  end

  def update
    if @game.update(game_params)
      @game.save
      redirect_to @game
    else
      render :edit
    end
  end

  def destroy
    redirect_to games_path if @game.destroy
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :photo)
  end

  def favorite_params
    params.require(:favorites).permit(:game_id, :user_id)
  end

end
