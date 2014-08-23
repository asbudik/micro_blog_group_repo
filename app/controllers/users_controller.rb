class UsersController < ApplicationController

	def index
		@users = User.all
	end


	def new
		@user = User.new
	end
	def create
		new_user = params[:user].permit(:email,:first_name,:last_name,:image_url)
		User.create(new_user)
		redirect_to users_path
	end




	def show
		id = params[:id]
		@user = User.find(id)
		render :show
	end


  def edit
    id = params[:id]
    @user = User.find(id)
    render :edit
  end
  def update
    user_id = params[:id]
    user = User.find(user_id)
    
    updated_params = params.require(:user).permit(:email,:first_name,:last_name,:image_url)
    user.update_attributes(updated_params)
    redirect_to user
  end


  def destroy
    id = params[:id]
    user = User.find(id)
    user.destroy
    redirect_to "/users"
  end



end
