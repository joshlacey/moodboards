class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :admin?, only: [:index]

  def index
    @users = User.all
  end

  def new
    if logged_in?
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
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

  def new_email_message
    @user = User.find_by(id: params[:id])
    render :email_form
  end

  def send_email
    @user = User.find_by(id: params[:id])
    @body = params[:email_message]
    @subject = params[:email_subject]
    EmailMailer.email_user(@user, @subject, @body).deliver
    redirect_to users_path
  end

  private

  def email_params
    params.require(:email).permit(:subject, :message)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :admin, :password, :password_confirmation, :email)
  end

end
