class PostsController < ApplicationController

  def index
    find_user_posts

    @posts = Post.all
  end

  def create
    find_user_posts

    new_post = params.require(:post).permit(:title, :body)
    @post = @user.posts.create(new_post)

    redirect_to [@user, @post]
  end

  def new
    find_user_posts
    @post = @user.posts.new
  end

  def edit
    find_user_posts

    @post = @user.posts.find(params[:id])
  end

  def update
    find_user_posts

    new_update_post = params.require(:post).permit(:title, :body)
    @post = @user.posts.find(params[:id])

    @post.update_attributes(new_update_post)

    redirect_to [@user, @post]
  end

  def show
    find_user_posts
    @post = @user.posts.find(params[:id])
  end

  def destroy
    find_user_posts

    @user.posts.find(params[:id]).destroy

    redirect_to users_path(@user.id)
  end

  # find the specified user in order to render the posts
  # that belong to that user
  def find_user_posts
    user_id = params[:user_id]
    @user = User.find(user_id)
  end
end