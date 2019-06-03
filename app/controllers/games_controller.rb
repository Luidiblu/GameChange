class GamesController < ApplicationController


  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def show
  end

  private

  def find_game
    #code
  end

  def game_params
    #code
  end
end
