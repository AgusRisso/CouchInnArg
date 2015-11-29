class Lodgingtype < ActiveRecord::Base
	has_many :lodgings, dependent: :destroy
  	validates_uniqueness_of :tipo, message: ":Ya existe"
  	validates_presence_of :tipo, message: ":Es requerido/a"
  	validates_format_of :tipo, with: /\A[a-zA-Z]+\z/,
  	message: ":Sólo letras permitidas"
end
