class FavoritesController < ApplicationController
  def index

  	@favorites = current_user.favorites.all
  end

  def create
  	@favorite = current_user.favorites.create(post_id: params[:favorites][:post_id])
  	redirect_to root_path
  end

  def destroy
  	@favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to favorites_path, :notice => "You removed a post from your list"
  end
end
