class Valorateguest < ActiveRecord::Base
	belongs_to :user
	belongs_to :lodging
	belongs_to :reservation

	validates_presence_of :comentario,message: "es requerido este campo"
	validates_length_of :comentario, minimum: 10, maximum: 140, message: ":No cumple con la cantidad mínima o máxima de caracteres,10 a 140"

end
