class UsersController < ApplicationController

	def index
		@users = User.all
	end


	def new
		@user = User.new
	end
	def create
		new_user = params[:user].permit(:email,:email_confirmation, :password, :password_confirmation, :first_name,:last_name,:image_url)
		check_if_new_user=User.new(new_user)
		  if check_if_new_user
        redirect_to users_path
      else
         flash.now[:notice]="Can't get you set up chump"
      # @user=User.new
      render 'users/new'
      end

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

    updated_params = params.require(:user).permit(:email,:email_confirmation,:first_name,:last_name,:image_url)
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
