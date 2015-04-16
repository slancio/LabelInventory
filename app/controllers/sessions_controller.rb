class SessionsController < ApplicationController
  before_action :require_no_user!, except: [:destroy]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email],params[:user][:password])
    if @user.nil?
      render :new
    else
      @user.reset_session_token!
      log_in_user!(@user)
      redirect_to user_url(@user)
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = ""
    redirect_to new_session_url
  end

end
