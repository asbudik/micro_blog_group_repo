class PostsController < ApplicationController

def index
@all_posts =Post.all
end

def create
post_data = params[:post].permit(:title, :body)
end

def new
end

def edit
@post= Post.find_by_id(params[:id])
end

def update
id_data=params[:id]
post_data=params[:post].permit(:title,:body)
end

def show
end

def destroy
post=Post.find_by_id(params[:id])
if post
post.destroy
end
redirect_to '/'
end


end