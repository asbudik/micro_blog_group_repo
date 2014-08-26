class SessionsController < ApplicationController
	def new
	end
	def create
		@user = User.authentication(params[:user][:email],params[:user][:password])

		if @user
			session[:user_id]= @user.user_id
			redirect_to login_url, notice: "you're logged in"
		else
			flash.now[:error] = "you're not logged in"
			render :new
		end
	end


	def destroy
		session[:user_id]=nil
		render text: "logged out"
	end
end
