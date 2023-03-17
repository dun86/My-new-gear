class Public::FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    favorite = current_customer.favorites.new(post_id: post.id)
    favorite.save
    redirect_to public_post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_customer.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to public_post_path(post)
  end

  def index
    @favorites = Favorite.all
  end

   def favorite_params
        params.require(:favorite).permit(:post_id,:customer_id)
   end


end
