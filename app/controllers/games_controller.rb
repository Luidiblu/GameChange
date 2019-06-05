class GamesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_game, only: %i[show edit update destroy]

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def show; end

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
end
