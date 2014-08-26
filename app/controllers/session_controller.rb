class SessionController < ApplicationController

	def new
		#login form
	end

	def create
		@user = User.authentication(params[:user][:email], params[:user][:password])

		if @user
			session[:user_id] = @user.user_id
			render text: "your logged in!"
		else
			render text: "not logged in"
		end
	end

	def destroy
		session[:user_id] =nil
		# render text: "logged out!"
		redirect_to '/'
	end

end
