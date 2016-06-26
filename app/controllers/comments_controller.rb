class CommentsController < ApplicationController
	before_filter :authorize
	before_action :find_post, only: [:create, :edit, :update, :destroy]
	before_action :find_comment, only: [:edit, :update, :destroy]

	def show
	end

	def new
	end

	def create
		@comment = @post.comments.create(params[:comment].permit(:comment))
		@comment.user_id = current_user.id if current_user
		@comment.save

		if @comment.save
			sync_new @comment, scope: @post
			sync_update @post
		end

		respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.json { head :no_content }
    end
	end

	def edit
	end

	def update
		if @comment.update(params[:comment].permit(:comment))
			sync_update @comment
			sync_update @post
		else
			render 'edit'
		end

		respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.json { head :no_content }
    end
	end

	def destroy
		@comment.destroy
		sync_destroy @comment
		sync_update @post.reload

		respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.json { head :no_content }
    end
	end

	private

	def find_post
		@post = Post.find(params[:post_id])
	end

	def find_comment
		@comment = @post.comments.find(params[:id])
	end

end
