class Reservation < ActiveRecord::Base
	belongs_to :lodging
	belongs_to :user
	has_many :valorateguests, dependent: :destroy

	 # Retorna las reservas confirmadas
  	scope :confirmate, -> { where(confirmate: true) }
end
