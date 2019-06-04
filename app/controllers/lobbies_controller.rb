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
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end
end
