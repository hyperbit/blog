class SessionsController < ApplicationController
  def new
	render :action => "new", :layout => false
  end

  def create
  	user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
  	if user
  		session[:user_id] = user.id
  		redirect_to root_url, :notice => "Logged in!"
  	else
  		flash.now.alert = "Invalid email or password"
		render :action => "new", :layout => false
  	end
  end
end
