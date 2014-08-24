class CommentsController < ApplicationController

	def create

		new_comment = params.require(:comment).permit(:content)
		postID = params.require(:pid)
		userID = params.require(:uid)

		@comment = Comment.create(new_comment)
		@post = Post.find(postID)

		if params[:cid] != nil
			commID = params.require(:cid)
			@comnt = Comment.find(commID)
			@comnt.comments << @comment
		else
			@post.comments << @comment
		end

		redirect_to "/users/#{userID}/posts/#{postID}"
	end
	
end
