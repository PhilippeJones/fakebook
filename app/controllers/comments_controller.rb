class CommentsController < ApplicationController
	before_filter :authorize, except: [:index, :show]
	before_action :find_comment, only: [:edit, :update, :destroy]

	def new
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:comment))
		@comment.user_id = current_user.id if current_user
		@comment.save

		if @comment.save
			redirect_to post_path(@post)
		else
			render 'new', error: "Comments can't be blank."
		end
	end

	def show
	end

	def edit
	end

	def update
		if @comment.update(params[:comment].permit(:comment))
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end

	def destroy
		@comment.destroy
		redirect_to post_path(@post)
	end

	private

	def find_comment
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
	end

end
