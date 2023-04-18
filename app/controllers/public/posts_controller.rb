class Public::PostsController < ApplicationController

  def index
    @posts = Post.all
    @posts = @posts.where("title LIKE ?", "%#{params[:search]}%") if params[:search].present?

    sort_by = params[:sort] || 'created_at_desc'
    sort_column, sort_direction = sort_by.split('_')

    case sort_column
    when 'created_at'
      order = sort_direction == 'asc' ? :asc : :desc
      @posts = @posts.order(created_at: order)
    else
      @posts = @posts.order(created_at: :desc)
    end

    @posts = @posts.page(params[:page]).per(10)
  end





    #ルーティングの変更後に追加
    def new
        #Postモデルのオブジェクトを作成
        # @postはインスタンス変数でviewで参照可能
        @post = Post.new
    end

    def create
     @post = Post.new(post_params)
     @post.customer_id = current_customer.id
    if @post.save
      @post.video.attach(params[:post][:video])
      redirect_to public_posts_path(@post), notice: "You have created post successfully."
    else
      @posts = Post.all
      render 'index'
    end
    end

    def edit
    @post = Post.find(params[:id])
    end

    # findメソッドで、idにひもづくPOSTオブジェクトを取得する
    def show
     @post = Post.find(params[:id])
     @post_comment =PostComment.new
     @post_comments = @post.post_comments.page(params[:page])
    end

    def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to public_post_path(@post), notice: "You have updated book successfully."
    else
      render "edit"
    end
    end

    def destroy
    @post =Post.find(params[:id])
    @post.destroy
    redirect_to public_posts_path
    end

    private

    #paramsから欲しいデータのみ抽出
    def post_params
      params.require(:post).permit(:title, :introduction, :genre_id, images: [], video: [])
    end
end