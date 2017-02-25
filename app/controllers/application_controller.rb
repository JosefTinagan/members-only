class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  attr_accessor :current_user

  helper_method :logged_in?

  def sign_in(user)
  	new_token = user.create_remember_token
  	user.remember_token = new_token
  	cookies.permanent[:remember_token] = new_token
  	session[:user_id] = user.id
  	current_user
 	end	

  def sign_out(user)
  	@current_user = nil
  	session.delete(:user_id)
  	cookies[:remember_token] = nil
  end

  def current_user
  	@current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
  	!current_user.nil?
  end
end
