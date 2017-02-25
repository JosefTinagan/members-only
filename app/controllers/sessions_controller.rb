class SessionsController < ApplicationController

	def new

	end

	def create
		@user = User.find_by(email: params[:session][:email])
		if @user && @user.authenticate(params[:session][:password])
			sign_in @user
			redirect_to home_path
		else
			flash.now[:danger] = "Invalid"
			render 'new'
		end
	end

	def destroy
		@user = User.find_by(remember_token: cookies[:remember_token])
		sign_out @user
	end
end
