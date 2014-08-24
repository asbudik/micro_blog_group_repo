class SitesController < ApplicationController

  def index
    @users = User.all
    @top_posts = Post.all.limit(3).order(created_at: :desc)
  end

  def show
  end
end
