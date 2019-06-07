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
  def skip
    redirect_to profile_path
  end
  def destroy
    @favorite.destroy
  end

end
