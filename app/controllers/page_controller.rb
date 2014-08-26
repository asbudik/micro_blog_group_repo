class PageController < ApplicationController

  def create
    find_user_pages

    new_page = params.require(:page).permit(:name, :content)
    @page = @user.pages.create(new_page)
      if @page.valid?
        flash[:notice] = "<ul>" + @page.errors.full_messages.map{|o| "<li>" + o + "</li>" }.join("") + "</ul>"
      end
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
    @page = Page.all.find(params[:id])


    @page.update_attributes(new_update_page)
    @page.save

    redirect_to [@user, @page]
  end

  def show
    find_user_pages
    @page = @user.pages.find(params[:id])
  end

  def destroy
    find_user_pages

    Page.all.find(params[:id]).destroy


    redirect_to page_path
  end

  # find the specified user in order to render the pages
  # that belong to that user
  def find_user_pages
    user_id = params[:user_id]
    @user = User.find(user_id)
  end
end