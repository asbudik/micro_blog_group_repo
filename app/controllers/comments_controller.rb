class CommentsController < ApplicationController
  before_action :find_parent

  def create
    @parent.comments.create(comment_params)
    redirect_to_post

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
