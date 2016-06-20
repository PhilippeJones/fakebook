class SessionsController < ApplicationController

	def new
	end

  def create
    @user = User.find_by name: params[:session][:name]

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Welcome back, #{@user.name}!"
    else
			render 'new', error: "Something went wrong. Let's try that again."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to signin_path
  end

end
