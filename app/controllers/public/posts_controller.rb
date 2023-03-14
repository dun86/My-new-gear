class Public::PostsController < ApplicationController
    def index
        # 投稿データを全て取得、またインスタンス変数なのでViewで参照可能
        @posts = Post.all
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
      redirect_to public_posts_path(@post), notice: "You have created book successfully."
    else
      @posts = Post.all
      render 'index'
    end
    end

    # findメソッドで、idにひもづくPOSTオブジェクトを取得する
    def show
     @post = Post.find(params[:id])
     @post_comment =PostComment.new
    end

    def update
    end

    def destroy
    end

    def update
    end

    private

    #paramsから欲しいデータのみ抽出
    def post_params
        params.require(:post).permit(:genre_id, :title, :introduction)
    end

end