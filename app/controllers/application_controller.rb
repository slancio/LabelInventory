class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def auth_token
    <<-HTML.html_safe
      <input type="hidden" 
             name="authenticity_token"
             value="#{form_authenticity_token}">
    HTML
  end

  def current_user
    return nil if session[:session_token].nil?
    @user ||= User.find_by_session_token(session[:session_token])
  end

  def log_in_user(user)
    @user = user
    session[:session_token] = user.session_token
  end

  def logged_in?
    !current_user.nil?
  end

end
