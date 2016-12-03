class Agency < ActiveRecord::Base
	has_many :packages
	has_many :users
end
