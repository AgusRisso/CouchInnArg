class ValorarHsController < ApplicationController
	def index
		
	end

  	def create
    	@user = current_user
    	@valorar= ValorarH.new(allowed_params)
    	@valorar.user=current_user
    	@valorar.lodging = $hospedaje
    	if (@valorar.save)
      		flash[:success] = "Se valoro correctamente"
      		redirect_to lodgings_path
    	else
      		render 'new' 
    	end
  	end

  	def new
  	end 

  	def edit
    	$hospedaje= Lodging.find(params[:id])
    	@valorar= ValorarH.new
    	render 'new'
  	end

  	def show
    	@valorar = ValorarH.find(params[:id])
  	end

  	def valoracionhospedajerecibida

  	end

  	private
   		def allowed_params
    	params.require(:valorar_h).permit(:promedio, :comentario)
   	end


end
