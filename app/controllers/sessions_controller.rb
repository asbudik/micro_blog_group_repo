class SessionsController < ApplicationController
	def new
	end
	def create
		@user = User.authentication(params[:user][:email],params[:user][:password])

		if @user
			session[:user_id]= @user.user_id
			render text: "you're logged in"
		else
			# flash.now[:notice]="Can't get you set up chump"
			# render 'users/new'
		end
	end
	def destroy
		session[:user_id]=nil
		render text: "logged out"
	end
end
