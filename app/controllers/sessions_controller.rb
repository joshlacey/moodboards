class SessionsController < ApplicationController

  def new
    if logged_in?
        redirect_to user_path(current_user)
    end
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      if @user.admin?
        redirect_to users_path
      else
        redirect_to user_path(@user)
      end
    else
      flash[:message] = "Username or password is incorrect."
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

end
