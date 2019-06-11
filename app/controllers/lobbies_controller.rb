class LobbiesController < ApplicationController
  before_action :set_game, only: %i[index new create]
  before_action :set_lobby, only: %i[show edit update enter_lobby exit_lobby]

  def index
    @lobbies = Lobby.where(game: @game)
  end

  def show
    @owner = @lobby.user

    unless @lobby.sessions.where(active: true).map(&:user).include? current_user
      flash[:notice] = "You may not see this lobby right now"
      redirect_to @lobby.game
    end
  end

  def new
    if current_user.sessions.select(&:active?).any?
      flash[:notice] = "You're already in another lobby!"
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

  def enter_lobby
    member = @lobby.sessions.where(active: true).map(&:user).flatten.include? current_user

    if @lobby.user_allowed?(current_user) || member
      unless member
        Session.create(
          lobby: @lobby,
          user: current_user,
          accepted: true,
          active: true
        )
      end

      if current_user.sessions.select { |s| s.active? == false }.map(&:lobby).include? @lobby
        lobby_session = current_user.sessions.find_by(lobby: @lobby)
        lobby_session.active = true
        lobby_session.save
      end

      redirect_to @lobby
    else
      flash[:notice] = 'You cant enter this lobby right now.'
      redirect_to game_path(@lobby.game)
    end
  end

  def exit_lobby
    game = @lobby.game

    new_inactive_session = current_user.sessions.find_by(lobby: @lobby)
    new_inactive_session.active = false
    new_inactive_session.save
    # raise

    if current_user == @lobby.user
      if @lobby.sessions.where(active: true).count.positive?
        @lobby.move_admin
        # raise
      else
        @lobby.active = false
        @lobby.save
        # raise
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
    l_users = @lobby.sessions.select(&:active?).map(&:user)
    unless @lobby.active
      flash[:notice] = "This lobby cannot be reached!"
      redirect_to @lobby.game
    end
  end

  def lobby_params
    params.require(:lobby).permit(:description, :competitive, :active, :max_players)
  end
end
