class CommentsController < ApplicationController

	def create

		# new_comment = params.require(:comment).permit(:content)
		# postID = params.require(:pid)
		# userID = params.require(:uid)

		# @comment = Comment.create(new_comment)
		# @post = Post.find(postID)

		# if params[:cid] != nil
		# 	commID = params.require(:cid)
		# 	@comnt = Comment.find(commID)
		# 	@comnt.comments << @comment
		# else
		# 	@post.comments << @comment
		# end
    @post = Post.find(params[:post_id])
    @new_comment = params.require(:comment).permit(:comment)
    userID = params.require(:user_id)

	  @comment = @post.comments.new(@new_comment)
	  if @comment.save
		redirect_to "/users/#{userID}/posts/#{@post.id}"
    end
  end
		# redirect_to "/users/#{userID}/posts/#{postID}"
	
end
