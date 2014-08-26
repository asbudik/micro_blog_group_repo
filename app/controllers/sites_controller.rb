class SitesController < ApplicationController

  def index
    @users = User.all.limit(3).order(created_at: :desc)
    @top_posts = []
    @users.each do |user|
      @top_posts << user.posts.limit(3).order(created_at: :desc)
    end
  end

  def show
  end

  def home
  end
end
