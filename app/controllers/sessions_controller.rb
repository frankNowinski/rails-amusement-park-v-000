class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find(params[:user][:id])
    return redirect_to signin_path if !@user
    session[:user_id] = @user.id
    redirect_to user_path(@user), notice: "Welcome back!"
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
