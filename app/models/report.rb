class Report < ActiveRecord::Base
	has_many :articles, dependent: :destroy
	belongs_to :users
end
