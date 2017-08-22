class ImagesController < ApplicationController

	def index
		#probably admin only
		@images = Image.all
	end

	def show
		@image = Image.find_by(id: params[:id])
	end

	def new
		@image = Image.new
		@user = User.find_by(id: session[:user_id])
		@projects = Project.all.select {|project| project.users.include?(@user)}
		@boards = @projects.map {|project| project.boards if !project.boards.empty?}.flatten
	end

	def create
		@image = Image.new(image_params)
		if @image.save
			redirect_to image_path(@image)
		else
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
		@image.destroy
		redirect_to images_path
	end

	private

	def image_params
		params.require(:image).permit(:title, :board_id, :url, :user_id)
	end

end