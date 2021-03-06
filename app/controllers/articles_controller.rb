class ArticlesController < ApplicationController
	def index
		@articles = Article.all.order("created_at DESC")
	end

	def new
		@article = Article.new
		if current_user
			render :action => 'new', :layout => false
		else
	    	redirect_to articles_path
    	end
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def show
		@article = Article.find(params[:id])
		render 'show'
	end

	def edit
		@article = Article.find(params[:id])
		if current_user
    		render :action => 'edit', :layout => false
	    else
	    	redirect_to @article
    	end
	end

	def update
		@article = Article.find(params[:id])
	 
		if @article.update(article_params)
	    	redirect_to @article
		else
	    	render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		if current_user
			@article.destroy
		end

		redirect_to articles_path
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end
end
