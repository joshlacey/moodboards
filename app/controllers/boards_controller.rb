class BoardsController < ApplicationController
	before_action :require_login

	def index
		#probably admin only
		@boards = Board.all
	end

	def show
		@board = Board.find_by(id: params[:id])
		session[:board_id] = @board.id
	end

	def new
		@board = Board.new
	end

	def create
		@board = Board.new(board_params)
		if @board.save
			redirect_to board_path(@board)
		else
			render :new
		end
	end

	def edit
		@board = Board.find_by(id: params[:id])
	end

	def update
		@board = Board.find_by(id: params[:id])
		if @board.update(board_params)
			redirect_to board_path(@board)
		else
			render :edit
		end
	end

	def destroy
		@board = Board.find_by(id: params[:id])
		@project = @board.project
		@board.destroy
		redirect_to project_path(@project)
	end


	private

	def board_params
		params.require(:board).permit(:title, :project_id)
	end

end