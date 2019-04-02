class PostsController < ApplicationController
  def index
    @posts = Post.all
    @users = User.all
  end

  def new
  end

  def edit
  end

  def create
    post = Post.new
    post.title = params[:title]
    post.subtitle = params[:subtitle]
    post.description = params[:description]
    post.user_id = current_user.id
    post.save

    redirect_to '/posts'
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find_by(id: @post[:user_id])
  end
end
