class Public::PostCommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_customer.post_comments.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to public_post_path(post)
  end
  
  def destroy
    PostComment.find(params[:id]).destroy
    @post = Post.find(params[:post_id])
    redirect_to public_post_path(@post.id)
  end
    
  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
