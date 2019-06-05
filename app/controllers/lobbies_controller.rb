class LobbiesController < ApplicationController
  before_action :set_game, only: %i[index new create]
  before_action :set_lobby, only: %i[show]

  def index
    @lobbies = Lobby.where(game: @game)
  end

  def show
    @owner = @lobby.user

    member = @lobby.users.include? current_user

    if @lobby.user_allowed?(current_user) || member
      unless member
        Session.create(
          lobby: @lobby,
          user: current_user,
          accepted: true,
          active: true
        )
      end

      flash[:notice] = 'Welcome'
    else
      flash[:notice] = 'You cant enter this lobby right now.'
      redirect_to game_path(@lobby.game)
    end
  end

  def new
    @lobby = Lobby.new
  end

  def create
    @lobby = Lobby.new(lobby_params)
    @lobby.game = @game
    @lobby.user = current_user

    if @lobby.save

      Session.create(lobby: @lobby, user: current_user, accepted: true, active: true)

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
