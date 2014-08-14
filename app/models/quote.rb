class Quote < ActiveRecord::Base
	validates :quote, presence: true
	validates :author, presence: true
end
