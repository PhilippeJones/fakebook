class PostsController < ApplicationController
  before_filter :authorize
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	before_action :new_post, only: [:index, :new]
	before_action :all_posts, only: [:index, :create]

  def index
		sync_update @posts
	end

	def show
	end

	def new
	end

	def create
		@post = current_user.posts.build(post_params)

		respond_to do |format|
			if @post.save
				sync_new @post
				sync_update @posts
				format.html { redirect_to root_path }
				format.json { head :no_content }
			end
    end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		sync_destroy @post
		sync_update @posts.reload

		respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
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

	def all_posts
		@posts = Post.includes(:comments).order("last_comment_at DESC").page params[:page]
	end

	def post_params
		params.require(:post).permit(:title, :content, :image)
	end
end
