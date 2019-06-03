class LobbiesController < ApplicationController
  before_action set_game, only: %i[index]

  def index
    @lobbies = Lobby.where(game: @game)
  end

  private

  def set_game
    # @game = Game.find(params[:id])
  end
end
