class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(user_params)
    if user
      session[:user_id] = user.id
      flash[:success] = "You done did logged in."
      redirect_to root_path
    else
      flash[:danger] = "Who dis?"
      redirect_to login_path
    end
  end

  #destroying the session aka log out
  def destroy
    session[:user_id] = nil
    flash[:success] = "You done did logged out."
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
