class UsersController < ApplicationController
  def index
    @users = User.all
    @posts = Post.all
    @count = 0
  end

  def new
  end

  def create
    user = User.new
    user.username = params[:username]
    user.email = params[:email]
    user.password = params[:password]
    user.image_url = params[:image_url]
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.save

    redirect_to "/users"
  end

  def edit
    @user = User.find_by(id: session[:user_id])
  end

  def update
    user = User.find_by(id: session[:user_id])
    user.name = params[:name]
    user.email = params[:email]
    user.password = params[:password]
    user.save!
    redirect_to '/users'
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
    @count = 0
  end

  def my_profile
    @user = User.find_by(id: session[:user_id])
    @posts = Post.where(user_id: current_user.id)
    @count = 0
  end

  def edit
    @user = User.find(params[:id])
  end
end