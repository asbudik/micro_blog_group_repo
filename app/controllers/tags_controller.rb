class TagsController < ApplicationController

	def index
		@tags = Tag.all
	end

  def show
  	tag_id = params[:id]
  	@tag = Tag.find(tag_id)
  end

end
