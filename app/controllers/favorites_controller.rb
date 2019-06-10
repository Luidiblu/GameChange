class FavoritesController < ApplicationController
  def new
    @favorite = Favorite.new
  end

  def create
    game_ids = params['favorite']['game_id']
    game_ids.each do |game_id|
      game = Game.where(id: game_id).first
      if game
        favorite = Favorite.new(user: current_user, game: game)
        favorite.save
      end
    end
    redirect_to root_path
  end

  def update
    game_id = Game.find(params[:id])
    game = Game.where(id: game_id).first
    Favorite.create(game: game, user: current_user)
    redirect_to games_path
  end

  def add_favorite
    # game_id = Game.find(params[:id])
    game_id = params[:game_id]
    game = Game.where(id: game_id).first
    favorite = Favorite.new(user: current_user, game_id: game_id)
    if favorite.save
      redirect_to game_path(game_id)
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:game_id, :user_id)
  end
end
