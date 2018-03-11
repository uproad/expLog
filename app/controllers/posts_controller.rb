class PostsController < ApplicationController
    before_action :authenticate_user,{only: [:index,:show,:edit,:update]}


  def index
    @posts = Post.all
  end

  def show
  	@post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
  end

  def new
  	@post = Post.new
  end

  def create
    @post = Post.new(content: params[:content],
                    user_id: @current_user.id,
                    title: params[:title]
                      )
    	if @post.save
    		flash[:notice] = "投稿しました"
    		redirect_to("/posts/index")
    	else
    		render('posts/new')
  		end
  	end
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end
end
