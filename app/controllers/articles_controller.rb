require 'open-uri'

class ArticlesController < ApplicationController

	def show
		@article = Article.find(params[:id])
		@report = @article.report
		@articles = @report.articles
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

	def destroy
		article = Article.find(params[:id])
		article.destroy
		redirect_to report_path(params[:report_id])
	end

	# def export 
	# 	id = params[:id]
	# 	# url = "http://localhost:3000/articles/#{id}" 
	# 	pdf_name = "/article-#{id}.pdf"
	# 	# kit = PDFKit.new(url)
	# 	kit = PDFKit.new("http://localhost:3000/articles/#{id}")
	# 	# file = kit.to_file("public/" + pdf_path)
	# 	path = kit.to_file("desktop")
	# 	redirect_to pdf_name
	# end

	def export
		id = params[:id]
		@article = Article.find(id)
	      respond_to do |format|
		      format.html
		      format.pdf do
		      render pdf: "article-#{id}",   # Excluding ".pdf" extension.
		      encoding: 'UTF-8'
	      end

	    end
	end

	private

	def article_params
		params.require(:article).permit(:title, :author, :article_body, :report_id)
	end

end
 