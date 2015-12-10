class ValorarH < ActiveRecord::Base
	belongs_to :lodging
	belongs_to :user

	validates_presence_of :comentario, message: ":Es requerido este campo"
	validates_length_of :comentario, minimum: 2, maximum: 140, message: ":No cumple con la cantidad de caracteres minimos o maximo, 2 a 140"
end
