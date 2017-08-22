class UsersController < ApplicationController

  #has_required_password

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @projects = Project.all.select {|project| project.users.include?(@user)}
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    session.clear
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :admin, :password, :email)
  end

end
