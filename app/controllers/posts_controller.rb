class PostsController < ApplicationController
  before_filter :authorize, except: [:index, :show]
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :new_post, only: [:index, :new]

  def index
		@posts = Post.all.order("created_at DESC")
		@users = User.all
	end

	def show
	end

	def new
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		if @post.destroy
			redirect_to root_path
		end
	end

	private
	def new_post
		if current_user
			@post = current_user.posts.build
		end
	end

	def find_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content, :image)
	end
end
