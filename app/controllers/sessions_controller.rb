class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = "Username or password is incorrect."
      redirect_to signin_path
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

end
