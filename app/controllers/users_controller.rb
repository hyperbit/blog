class UsersController < ApplicationController
  def new
  	@user = User.new
    render :action => "new", :layout => false
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to articles_path, :notice => "Signed up!"
  	else
  		render "new"
  	end
  end

  private
  	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation)
	end
end
