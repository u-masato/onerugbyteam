class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    player = Player.find(params[:player_id])
    current_user.add_favorite(player)
    redirect_back(fallback_location: users_path)
  end

  def destroy
    player = Player.find(params[:player_id])
    current_user.remove_favorite(player)
    redirect_back(fallback_location: users_path)
  end
end
