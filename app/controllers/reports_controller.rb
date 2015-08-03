class ReportsController < ApplicationController

	def create
		@report = Report.new(report_params)
		
		respond_to do |format|
			if @report.save
				format.js
			else
				redirect_to root
			end
		end
	end


	def show
	end

	private

	def report_params
		params.require(:report).permit(:title)
	end

end
