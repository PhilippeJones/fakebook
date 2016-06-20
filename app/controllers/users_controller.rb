class UsersController < ApplicationController
	before_action :find_user, only: [:show, :edit, :update, :destroy]

	def show
		render 'profile'
	end

	def new
	end

	def edit
		@user = current_user

		render 'profile'
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			redirect_to root_path, notice: "Glad to have you, #{@user.name}!"
		else
			render 'new', error: "Something went wrong. Let's try that again."
		end
	end

	def update
		@user = current_user

		if @user.update(user_params)
			redirect_to current_user
		else
			render 'profile'
		end
	end

	def destroy
		@user.avatar = nil
		@user.save
	end

	private

	def find_user
		@user = User.find(params[:id])
	end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :avatar)
  end
end
