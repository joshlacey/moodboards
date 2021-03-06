class ImagesController < ApplicationController
	before_action :require_login

	def index
		#probably admin only
		@images = Image.all
	end

	def show
		@image = Image.find_by(id: params[:id])
	end

	def new
		@image = Image.new
	end

	def create
		@image = Image.new(image_params)
		if @image.save
			flash[:invalid_url] = ""
			redirect_to image_path(@image)
		else
			flash[:invalid_url] = "The url or file you have selected is invalid."
			render :new
		end
	end

	def edit
		@image = Image.find_by(id: params[:id])
	end

	def update
		@image = Image.find_by(id: params[:id])
		if @image.update(image_params)
			redirect_to image_path(@image)
		else
			render :edit
		end
	end

	def destroy
		@image = Image.find_by(id: params[:id])
		@board = @image.board
		@image.destroy
		redirect_to board_path(@board)
	end

	private

	def image_params
		params.require(:image).permit(:title, :board_id, :url, :user_id, :photo)
	end

end
