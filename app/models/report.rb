class Report < ActiveRecord::Base
	has_many :articles
	belongs_to :users
end
