require 'open-uri'

class ArticlesController < ApplicationController

	def show	
	end

	def new
		source = open(params["query"]).read
		my_reader = ElPaisReader.new(source)
		@title = my_reader.title
		@author = my_reader.author
		@content = my_reader.content.html_safe
		render :result
	end

end
 