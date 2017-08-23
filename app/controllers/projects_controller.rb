class ProjectsController < ApplicationController
  before_action :require_login

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    # @user = User.find_by(id: session[:user_id])
    # @project.users << @user
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def show
    @project = Project.find_by(id: params[:id])
  end

  def edit
    @project = Project.find_by(id: params[:id])
  end

  def update
    @project = Project.find_by(id: params[:id])
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find_by(id:params[:id])
    @project.destroy
    redirect_to projects_path
  end

  def approve_project
    @project = Project.find_by(id: params[:project_id])
    @project.approve
    @project.save
    redirect_to project_path(@project)
  end

  def reject_project
    @project = Project.find_by(id: params[:project_id])
    @project.reject
    @project.save
    redirect_to project_path(@project)
  end
  
  private

  def project_params
    params.require(:project).permit(:title, :status, :description, user_ids: [])
  end

end
