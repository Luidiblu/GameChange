class LobbiesController < ApplicationController
  before_action :set_game, only: %i[index new create]

  def index
    @lobbies = Lobby.where(game: @game)
  end

  def show
  end

  def new
    @lobby = Lobby.new
  end

  def create
    @lobby = Lobby.new(lobby_params)
    @lobby.game = @game

    if @lobby.save

      Session.create(lobby: @lobby, user: current_user, accepted: true)

      redirect_to @game
    else
      # alert.message("Uau")

      render :new
    end
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def lobby_params
    params.require(:lobby).permit(:description, :competitive, :active, :max_players)
  end
end
