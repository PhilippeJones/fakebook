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
#			redirect_to post_path(@post)
#		else
#			redirect_to 'new', error: "Comments can't be blank."
		end

		respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.json { head :no_content }
    end
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
		@comment.destroy
		sync_destroy @comment
		sync_update @post.reload
#		redirect_to post_path(@post)

		respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.json { head :no_content }
    end
	end

	private

	def find_comment
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
	end

end
