class LobbiesController < ApplicationController
  before_action :set_game, only: %i[index new]

  def index
    @lobbies = Lobby.where(game: @game)
  end

  def show
  end

  def new
    @lobby = Lobby.new(game: @game)
  end

  def create
    @lobby = Lobby.new(lobby_params)
    @game = @lobby.game

    if @lobby.save
      redirect_to @game
    else
      render :new
    end
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def lobby_params
    params.require(:lobby).permit(:game_id, :competitive, :active)
  end
end
