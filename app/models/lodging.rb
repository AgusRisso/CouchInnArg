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
	
	def self.search(search_titulo,search_cant,search_tipo_id,search_zona,start_date,end_date)
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

      	result = [] # En result agregaremos los hospedajes libres
    	lodgings.each do |lodging|
      		result << lodging if lodging.is_free?(start_date,end_date) # Agregamos el hospedaje si está libre
    	end

      	return result	

    end

  	# Recibe como parámetros las fechas en las que se busca 
  	# que esté libre el couch
    def is_free?(start_date,end_date)
    	reservas_del_couch = self.reservations # reservas del couch (por el has_many)
    	reservas_confirmadas = reservas_del_couch.confirmate # solo miramos las confirmadas
    	reservas_confirmadas = reservas_confirmadas.where('? < dateexit', start_date) # from se copiaría en el lugar de '?'
    	reservas_confirmadas = reservas_confirmadas.where('? > dateinit', end_date) # to se copiaría en el lugar de '?'
    
    	# Retorno true o false si el resultado de lo anterior 
    	# está vacío o no
    	return reservas_confirmadas.empty?
    end

    # Retorna los couches que están libres entre 2 fechas
  	# Por una cuestión de simplicidad se realiza iterando sobre 
  	# sobre los couches
  	def self.free_couches(from, to)
    	result = [] # En result agregaremos los hospedajes libres
    	Couch.all.each do |couch|
      		result << couch if couch.is_free?(from, to) # Agregamos el hospedaje si está libre
    	end
  	end
end
