class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

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
    if current_user == @user
      redirect_to user_path(@user)
    elsif current_user != @user && current_user.admin?
      redirect_to users_path
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    session.clear
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :admin, :password, :password_confirmation, :email)
  end

end
