class Agency < ActiveRecord::Base
	has_many :packages, dependent: :destroy
	has_many :users
end
