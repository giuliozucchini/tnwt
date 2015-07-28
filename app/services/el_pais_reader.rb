
class ElPaisReader < Readability::Document
	
	def title
		super.split(" | ")[0]
	end

end 