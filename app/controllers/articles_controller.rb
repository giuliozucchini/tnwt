require 'open-uri'

class ArticlesController < ApplicationController

	def show
		render :show	
	end

	def new
		if params[:query].present?
			uri = URI.escape(params[:query]) 
			source = open(uri).read
			my_reader = ElPaisReader.new(source)
			@title = my_reader.title
			@author = my_reader.author
			@content = my_reader.content.html_safe
		end
		
		@report = Report.new
		@reports = current_user.reports
		render :result
	end

	def create
		@article = Article.create(article_params)
		if @article.save			
			@report = @article.report
			@articles = @report.articles
			render :report_info
		else
			render json: { status: :unprocessable_entity }
		end
	end

	private

	def article_params
		params.require(:article).permit(:title, :author, :article_body, :report_id)
	end

end
 