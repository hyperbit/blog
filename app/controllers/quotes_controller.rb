class QuotesController < ApplicationController
	def index
		@quotes = Quote.all
	end

	def new
		@quote = Quote.new
		if current_user
			render :action => 'new', :layout => false
		else
			redirect_to root_url
		end
	end

	def create
		@quote = Quote.new(quote_params)

		if @quote.save
			redirect_to quotes_path
		else
			render 'new'
		end
	end

	def edit
		@quote = Quote.find(params[:id])
		if current_user
    		render :action => 'edit', :layout => false
	    else
	    	redirect_to @article
    	end
	end

	def update
		@quote = Quote.find(params[:id])
	 
		if @quote.update(article_params)
	    	redirect_to root_url
		else
	    	render 'edit'
		end
	end

	def destroy
		@quote = Quote.find(params[:id])
		if current_user
			@quote.destroy
		end

		redirect_to quotes_path
	end

	private
		def quote_params
			params.require(:quote).permit(:quote, :author)
		end
end