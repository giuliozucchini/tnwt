class AddReportIdColumnToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :report_id, :integer
  	add_foreign_key :articles, :reports
  end
end
