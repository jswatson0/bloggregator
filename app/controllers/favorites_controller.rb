class FavoritesController < ApplicationController
  def index
  	@favorites = current_user.favorites.all

    @favorite = Favorite.new
  end

  def create
  	@favorites = current_user.favorites.create(post_id: params[:favorites][:post_id])
    @favorites.save

    redirect_to do |format|
      format.html { redirect_to root_url, flash: {success: 'Comment successfully created.'} }
      format.js { render :layout => false }
    end
  end

  

  def destroy
  	@favorite = Favorite.find(params[:id])
    @favorite.destroy
    respond_to do |format|
      format.html do
        redirect_to favorites_path, :notice => "You removed a post from your list"
      end
      format.js
    end
  end
end
