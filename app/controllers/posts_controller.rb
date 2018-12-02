class PostsController < ApplicationController
	def index
		@posts = Post.all

	end

	def new
		@post = Post.new
		@category = Category.all	

	end

	def create
		@post = Post.new(posts_params)
		if @post.save	
			redirect_to posts_path, :notice => "Your post has been save"
		else
			render "new"
		end	
	end

	def edit
		@post = Post.find(params[:id])
	end

	def show
		@post = Post.find(params[:id]) #бере id з url
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(posts_params)
			redirect_to posts_path, :notice => "Your post has been updated"
		else
			render "edit"
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		
		redirect_to posts_path, :notice => "Your post has been deleted"
		
	end

	private

	def posts_params
      params.require(:post).permit(:title, :body, :category_id, :author_id)
    end

end
