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
		@report = Report.find(params[:id])
		@articles = @report.articles
	end

	def dahsboard
		@report_list = Report.all
	end

	def destroy
		report = Report.find(params[:id])
		report.destroy
		redirect_to dashboard_index_path
	end

	private

	def report_params
		params.require(:report).permit(:title)
	end

	

end