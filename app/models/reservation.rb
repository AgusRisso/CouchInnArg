class Reservation < ActiveRecord::Base
	belongs_to :lodging
	belongs_to :user
end
