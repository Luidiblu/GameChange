class LobbiesController < ApplicationController
  before_action :set_game, only: %i[index new create]
  before_action :set_lobby, only: %i[show edit update exit_lobby]

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

      if current_user.lobbies.include? @lobby
        lobby_session = current_user.sessions.find_by(lobby: @lobby)
        lobby_session.active = true
        lobby_session.save

        # raise

      end

      # flash[:notice] = 'Welcome'
    else
      flash[:notice] = 'You cant enter this lobby right now.'
      redirect_to game_path(@lobby.game)
    end
  end

  def new
    if current_user.sessions.select(&:active?).any?
      flash[:notice] = "You're already in another lobby!."
      redirect_to game_path(@game)
    else
      @lobby = Lobby.new
    end
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

  def edit
    unless current_user == @lobby.user
      flash[:notice] = 'Only the ADMIN can change the lobby settings'
      redirect_to @lobby
    end
  end

  def update
    if @lobby.update(lobby_params)
      flash[:notice] = 'Your changes have been saved!'
      redirect_to @lobby
    else
      render :edit
    end
  end

  def exit_lobby
    new_inactive_session = current_user.sessions.select(&:active?).first
    new_inactive_session.active = false
    new_inactive_session.save

    game = @lobby.game

    # raise

    if current_user == @lobby.user
      if @lobby.sessions.select(&:active?).count.positive?
        @lobby.move_admin
      else
        # raise
        @lobby.active = false
        @lobby.save00
      end
    end
    redirect_to game
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def set_lobby
    @lobby = Lobby.find(params[:id])

    unless @lobby.active
      flash[:notice] = "This lobby cannot be reached!"
      redirect_to @lobby.game
    end

  end

  def lobby_params
    params.require(:lobby).permit(:description, :competitive, :active, :max_players)
  end
end
