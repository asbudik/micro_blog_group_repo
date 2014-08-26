class SessionController < ApplicationController

	def new
		#login form
	end

	def create
		@user = User.authentication(params[:user][:email], params[:user][:password])

		if @user
			session[:user_id] = @user.user_id
			render text: "uuhh, you loggin in!"
		else
			render text: "Nope you ain't logged in"
		end
	end

	def destroy
		session[:user_id] =nil
		render text: "Man you logged out!"
	end
end
