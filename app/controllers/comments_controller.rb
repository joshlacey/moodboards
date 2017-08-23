class CommentsController < ApplicationController
	before_action :require_login
	# def index
	# 	@comments = Comment.all
	# end

	# def show
	# 	@comment = Comment.find_by(id: params[:id])
	# end

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)
		@comment.user = current_user
		if @comment.save
			if @comment.image_id
				redirect_to image_path(@comment.image)
			elsif @comment.board_id
				redirect_to board_path(@comment.board)
			elsif @comment.project_id		
				redirect_to project_path(@comment.project)
			end
		else
			#CHANGE LATER
			redirect_to root_path
		end
	end

	def edit
		@comment = Comment.find_by(id: params[:id])
	end

	def update
		@comment = Comment.find_by(id: params[:id])
		if @comment.update(comment_params)
			@project = @comment.project
			redirect_to project_path(@project)
		else
			render :edit
		end
	end

	def destroy
		@comment = Comment.find_by(id: params[:id])
		@project = @comment.project
		@comment.destroy
		redirect_to project_path(@project)
	end

	private

	def comment_params
		params.require(:comment).permit(:content, :image_id, :board_id, :project_id, :user_id)
	end

end
