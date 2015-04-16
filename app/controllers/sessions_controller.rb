class SessionsController < ApplicationController
  before_action :prevent_double_login, except: [:destroy]

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
      redirect_to user_url
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = ""
    redirect_to user_url
  end

  private

    def prevent_double_login
      redirect_to user_url unless current_user.nil?
    end

end
