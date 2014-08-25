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
    
   #  def create
   #    comment_params = params.require(:comment).permit(:author, :content)
   #    @comment = Comment.new(comment_params)

	  # if params[:comment][:parent_id].to_i > 0
	  #   parent = Comment.find_by_id(params[:comment].delete(:parent_id))
	  #   @comment = parent.children.build(comment_params)
	  # else
	  #   @comment = Comment.new(comment_params)
	  # end
	 
	  # if @comment.save
	  #   flash[:success] = 'Your comment was successfully added!'
	  #   redirect_to root_url
	  # else
	  #   render 'new'
	  # end
		# redirect_to "/users/#{userID}/posts/#{postID}"
	end
	
end
