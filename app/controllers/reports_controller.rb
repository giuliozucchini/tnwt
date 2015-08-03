class ReportsController < ApplicationController

	def create
		@report = Report.new(report_params)
		if @report.save
			render @report

		else
			redirect_to root
		end
	end


	def show
	end

	private

	def report_params
		params.require(:report).permit(:title)
	end

end
