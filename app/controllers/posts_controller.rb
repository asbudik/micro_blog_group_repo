class PostsController < ApplicationController
  before_action :find_user
  before_action :find_user_post, :except => [:index, :new, :create]
  def index
    @posts = @user.posts
  end

  def create
    post = Post.new(post_params)
    if post.save && @user
      post.add_tags tag_params
      @user.posts << post
      redirect_to user_posts_path(@user.id)
    else
      flash[:error] = post.errors.full_messages.to_sentence
      redirect_to new_user_post_path @user.id
    end
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      @post.add_tags tag_params
      redirect_to user_posts_path(@user)
    else
      redirect_to user_post_path @user.id, @post.id
    end
  end

  def show
    @comments = @post.comments
    @post_tags = @post.tags
    @tags = @user.tags.uniq {|tag| tag.name} 
  end


  def destroy
    @post.destroy
    redirect_to user_posts_path @user.id
  end

  # find the specified user in order to render the posts
  # that belong to that user
  private
    def find_user
      user_id = params[:user_id]
      @user = User.find_by_id(user_id)
      redirect_to users_path unless @user
    end
    def find_user_post
      id = params[:id]
      @post = Post.find_by_id(id)
      redirect_to user_posts_path(@user.id) unless @post
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end

    def tag_params
      tags = params[:tags].split(/\,\s*|\s*\#|\s+/)
    end
end