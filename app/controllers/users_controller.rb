class UsersController < ApplicationController
  def new
  	@user = User.new
    render :action => "new", :layout => false
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to new_session_path, :notice => "Signed up!"
  	else
  		render :action => "new", :layout => false
  	end
  end

  private
  	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation)
	end
end
