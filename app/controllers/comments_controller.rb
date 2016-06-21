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
			sync_new @comment, scope: @post
			sync_update @post
			redirect_to post_path(@post)
		else
			redirect_to 'new', error: "Comments can't be blank."
		end

# First AJAx attempt
#		respond_to do |format|
#			if @comment.save
#				format.html { redirect_to @post, notice: 'Comment was posted successfully.' }
#				format.js
#				format.json { render json: @comment, status: :created, location: @comment }
#			else
#				format.html { render action: "new" }
#				format.json { render json: @comment.errors, status: :unprocessable_entity }
#			end
#		end
	end

	def show
	end

	def edit
	end

	def update
		if @comment.update(params[:comment].permit(:comment))
			sync_update @comment
			sync_update @post
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end

	def destroy
#		respond_to do |format|
#			@comment.destroy
#			format.html { redirect_to post_path(@post), notice: 'Comment was deleted successfully.' }
#			format.js
#			format.json { render json: @post }
#		end
		@comment.destroy
		sync_destroy @comment
		sync_update @post.reload
		redirect_to post_path(@post)
	end

	private

	def find_comment
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
	end

end
