class PostsController < ApplicationController
  before_action :find_user
  # before_action :tag_params, :except => [:index, :new, :edit, :show, :destroy]
  before_action :find_user_post, :except => [:index, :new, :create]
  def index
    @posts = @user.posts
  end

  def create
    tag_params = params[:tags].split(/\,\s*|\s*\#|\s+/)

    post = Post.new(post_params)
    if post.save && @user
      # post.add_tags tag_params
      existing = Tag.where(name: tag_params)
      new_tags = tag_params - existing.map {|tag| tag.name }
      tag_params.uniq.each do |tag|

        new_tag = Tag.create(name: tag)
        post.tags << new_tag
      end
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
    if @post.tags.length > 0
      @tags = @post.tags
      @update_tags = ""
      @tags.each do |tag|
        @update_tags += " #{tag.name}"
      end
    else
      @update_tags = ""
    end
  end

  def update
    tag_params = params[:tags].split(/\,\s*|\s*\#|\s+/)
    puts "!!!!!!!!!!!!#{tag_params}!!!!!!!!!!!!!"

    check_ids_for_empty = @post.tags.pluck(:id)
    check_ids_for_empty.each do |check_id|
      Tag.find_by_id(check_id).destroy
    end

    if @post.update_attributes(post_params)
      @post.tags.destroy_all

      existing = Tag.where(name: tag_params)
      new_tags = tag_params - existing.map {|tag| tag.name }
      tag_params.uniq.each do |tag|

        existing_tag = Tag.where(name: tag).first
        if !existing_tag
          new_tag = Tag.create(name: tag)
          @post.tags << new_tag
        else
          @post.tags.each do |post|
            if post != existing_tag
              post.tags << existing_tag
            end
          end
        end
      end
      redirect_to user_posts_path(@user), :notice => "Updated your post!"
    else
      redirect_to user_post_path @user.id, @post.id, :notice => "Something went wrong."
    end
  end

  def show
    @comments = @post.comments
    @post_tags = @post.tags
    @tags = @user.tags.uniq {|tag| tag.name} 
  end


  def destroy
    @post.posttags.each do |association|
      if association.post_id == @post.id
        tag = association.tag_id
        suspect_tag = Tag.all.find(tag)
        association.destroy
        if suspect_tag.posttags.length == 0
          suspect_tag.destroy
        end
      end
    end
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
end