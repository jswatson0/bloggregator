class FavoritesController < ApplicationController
  def index
    params[:per_page] ||= 5
    params[:page]     ||= 1

    @favorites = Favorite.order("created_at DESC").page(params[:page].to_i).per_page(params[:per_page].to_i)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
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
