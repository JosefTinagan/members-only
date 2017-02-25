class PostsController < ApplicationController
	before_action :logged_user, only: [:new,:create]

  def index
  	@posts = Post.all
  end

  def new
  	@user = current_user
  	@post = Post.new
  end

  def create
  	@user = current_user
  	@post = Post.new(user_id: @user.id, title: params[:post][:title], body: params[:post][:body])
  	
  	if @post.save
  		flash[:success] = "Post successful"
  		redirect_to posts_path
  	else
  		render 'new'
  		flash.now[:danger] = "Post unsuccessful"
  	end
  end

  private

  	def logged_user
  		unless logged_in?
  			flash[:danger] = "Please log in."
  			redirect_to login_url
  		end
  	end
end
