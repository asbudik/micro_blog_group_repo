class CommentsController < ApplicationController
  before_action :find_parent

  def create
    @parent.comments.create(comment_params)

    check_if_new_comment=Comment.new(new_comment)
      if check_if_new_comment.save
        redirect_to post
      else
      flash.now[:notice]="Can't Create Comment"
       @comment=Comment.new
      render 'comments/_form'
      end
  end

  private

    def find_parent
      @parent = @post = Post.find_by_id(params[:post_id])
      if params[:id]
        @parent = Comment.find_by_id(params[:id])
      end
      redirect_to users_path unless @parent
    end

    def comment_params
      params.require(:comment).permit(:content)
    end

    def redirect_to_post
      redirect_to user_post_path @post.user_id, @post.id
    end
end
