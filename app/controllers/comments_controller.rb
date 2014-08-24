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
    @new_comment = params[:comment].permit(:comment)
    userID = params.require(:user_id)

    if !params[:comment_id].blank?
		@commentable = Comment.find(params[:comment_id])


	  @NEWCOMMENT = @commentable.comments.create(@new_comment)
    # if @commentable
    #   @comment = @commentable.comments.build(params[:comment])
      	# if @comment.save

				  redirect_to "/users/#{userID}/posts/#{@post.id}"
		else
			@comment = @post.comments.create(@new_comment)
			@post.comments << @comment
			redirect_to "/"
		    # end
        # flash.now[:alert] = "You had some errors for your comment."  # edited 10/28/10 use 'flash.now' instead of 'flash'
        # render_error_page
    end

  end
		# redirect_to "/users/#{userID}/posts/#{postID}"
	
end
