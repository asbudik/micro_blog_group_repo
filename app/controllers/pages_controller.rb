class PagesController < ApplicationController

  def create
    find_user_pages

    new_page = params.require(:page).permit(:name, :content)
    @page = @user.pages.create(new_page)

    redirect_to [@user, @page]
  end

  def new
    find_user_pages
    @page = @user.pages.new
  end

  def edit
    find_user_pages

    @page = @user.pages.find(params[:id])
  end

  def update
    find_user_pages

    new_update_page = params.require(:page).permit(:name, :content)
    @page = @user.pages.find(params[:id])

    @page.update_attributes(new_update_page)

    redirect_to [@user, @page]
  end

  def show
    find_user_pages
    @page = @user.pages.find(params[:id])
  end

  def destroy
    find_user_pages

    @user.pages.find(params[:id]).destroy

    redirect_to users_path(@user.id)
  end

  # find the specified user in order to render the pages
  # that belong to that user
  def find_user_pages
    user_id = params[:user_id]
    @user = User.find(user_id)
  end
end