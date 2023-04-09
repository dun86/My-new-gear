class Public::FavoritesController < ApplicationController
   def create
    @post = Post.find(params[:post_id])
    favorite = current_customer.favorites.new(post_id: @post.id) # @postを参照するように修正
    favorite.save
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_customer.favorites.find_by(post_id: @post.id) # @postを参照するように修正
    favorite.destroy
  end
  
  def index
    @favorites = current_customer.favorites
  end

   def favorite_params
        params.require(:favorite).permit(:post_id,:customer_id)
   end


end
