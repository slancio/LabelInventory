class UsersController < ApplicationController
  before_action :prevent_double_login

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      log_in_user!(@user)
      redirect_to user_url
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private

    def user_params
      params.require(:user).permit(:email, :password)
    end

    def prevent_double_login
      redirect_to user_url unless current_user.nil?
    end

end
