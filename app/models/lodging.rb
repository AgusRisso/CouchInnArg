class Lodging < ActiveRecord::Base
	belongs_to :lodgingtype
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :valorarHs, dependent: :destroy
	has_many :reservations, dependent: :destroy

	validates_presence_of :titulo, message: ":Es requerido este campo"
	validates_uniqueness_of :titulo, message: ":Ya existe este titulo"
	validates_format_of :titulo, with: /\A[a-zA-Z ]+\z/, message: ":Sólo se permiten letras"
	validates_presence_of :detalle, message: ":Es requerido este campo"
	validates_length_of :descripcion, minimum: 10, maximum: 50, message: ":No cumple con la cantidad de caracteres minimos o maximo, 10 a 50"
	validates_presence_of :descripcion, message: ":Es requerido este campo"
	validates_length_of :detalle, minimum: 50, maximum: 256, message: ":No cumple con la cantidad mínima o máxima de caracteres,50 a 256"
	validates_presence_of :zona, message: ":Es requerido este campo"
	validates_format_of :zona, with: /\A[a-zA-Z ]+\z/, message: ":Sólo se permiten letras"
	validates_presence_of :lodgingtype_id, message: ":Es requerido este campo"
	validates_presence_of :cantidaddehuespedes, message: ":Es requerido este campo"
	validates :cantidaddehuespedes, :numericality => {:only_integer => true, message: "Solo se permiten numeros"}
	validates_presence_of :url, message: ":Es requerido este campo"
	
	def self.search(search_titulo,search_cant,search_tipo_id,search_zona)
		lodgings = Lodging.all

		if search_titulo.present?
      		lodgings = lodgings.where(["titulo LIKE ? ","%#{search_titulo}%"])
      	end

      	if search_cant.present?
      		lodgings = lodgings.where(cantidaddehuespedes: search_cant)
      	end

      	if search_tipo_id.present?
      		lodgings = lodgings.where(lodgingtype_id: search_tipo_id)
      	end

		if search_zona.present?
      		lodgings = lodgings.where(["zona LIKE ? ","%#{search_zona}%"])
      	end

      	return lodgings	

    end

end
