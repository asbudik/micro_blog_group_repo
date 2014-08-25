class PostsController < ApplicationController

  def index
    find_user_posts

    @posts = @user.posts
  end

  def create
    find_user_posts

    new_post = params.require(:post).permit(:title, :body)
    @post = @user.posts.create(new_post)


   # CREATE A TAG
    tag_data = params[:tags].split(",").map(&:strip).map(&:downcase)

    tag_data.each do |tag_str|
      tag = Tag.find_by_name(tag_str)
      if tag == nil
        tag = Tag.create(:name => tag_str)
      end
      @post.tags << tag
    end

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
    @post = Post.all.find(params[:id])

    @post.update_attributes(new_update_post)
    @post.save
    redirect_to [@user, @post]
  end

  def show
    find_user_posts
    @post = @user.posts.find(params[:id])
    @comment = @user.posts.find(params[:id]).comments.new
  
      

  end


  def destroy
    find_user_posts

    Post.all.find(params[:id]).destroy

    redirect_to users_path(@user.id)
  end

  # find the specified user in order to render the posts
  # that belong to that user
  def find_user_posts
    user_id = params[:user_id]
    @user = User.find(user_id)
  end
end