class PagesController < ApplicationController  
  before_action :find_user
  before_action :find_user_page, :except => [:index, :new, :create]
  def index
    @pages = @user.pages
  end

  def show
  end
  
  def new
    @page = Page.new
  end

  def edit
  end

  def create
    page = @user.pages.new(page_params)
    if page.save
      redirect_to user_pages_path(@user.id)
    else
      redirect_to new_user_page_path @user.id
    end
  end

  def update
    unless @page.update_attributes(page_params)
      redirect_to user_pages_path(@user.id)
    else
      redirect_to user_page_path @user.id, @page.id
    end
  end

  private
    def find_user
      user_id = params[:user_id]
      @user = User.find_by_id(user_id)
      redirect_to users_path unless @user
    end

    def find_user_page
      id = params[:id]
      @page = Page.find_by_id(id)
      redirect_to user_pages_path(@user.id) unless @page
    end

    def page_params
      params.require(:page).permit(:name, :content)
    end
end
