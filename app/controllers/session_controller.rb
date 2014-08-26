class SessionController < ApplicationController
	def new
	end
	def create
		@user = User.authentication(params[:user][:email],params[:user][:password])

		if @user
			session[:user_id]= @user.user_id
			render text: "you're logged in"
		else
			render text: "you're not logged in"
		end
	end
	def destroy
		session[:user_id]=nil
		render text: "logged out"
	end
end
