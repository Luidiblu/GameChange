class LobbiesController < ApplicationController
  before_action :set_game, only: %i[index new create]
  before_action :set_lobby, only: %i[show]

  def index
    @lobbies = Lobby.where(game: @game)
  end

  def show
    @owner = @lobby.user
    @enterable = params[:enter] == 'true'
  end

  def new
    @lobby = Lobby.new
  end

  def create
    @lobby = Lobby.new(lobby_params)
    @lobby.game = @game
    @lobby.user = current_user

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

  def set_lobby
    @lobby = Lobby.find(params[:id])
  end

  def lobby_params
    params.require(:lobby).permit(:description, :competitive, :active, :max_players)
  end
end
