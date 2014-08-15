class WelcomeController < ApplicationController
	def index
		#render :action => "index", :layout => false
		redirect_to 'http://www.jcano.info', :status => 301
	end
end
