class ReportsController < ApplicationController

	def create
		@report = current_user.reports.create(report_params)
		if @report.save
			render json: @report
		else
			render json: @report.errors, status: :unprocessable_entity
		end
	end


	def show
	end

	private

	def report_params
		params.require(:report).permit(:title)
	end

end