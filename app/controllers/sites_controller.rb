class SitesController < ApplicationController

  def index
    @top_posts = Post.all.limit(3).order(created_at: :desc)
  end

  def show
  end
end
