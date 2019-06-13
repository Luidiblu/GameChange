class FavoritesController < ApplicationController

  def already_favorited?
    Favorite.where(user_id: current_user.id, game_id: params[:game_id]).exists?
  end


  def new
    @favorite = Favorite.new
  end

  def create
    if already_favorited?
      flash[:notice] = "You can't favorite more than once"
      else
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
    favorite.save
  end

  private

  def favorite_params
    params.require(:favorite).permit(:game_id, :user_id)
  end
end
