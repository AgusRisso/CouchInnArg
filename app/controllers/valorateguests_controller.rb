class ValorateguestsController < ApplicationController
	def new
	
	end

	def create
		user = current_user
    	valorar= Valorateguest.new(allowed_params)
    	valorar.user=$usuario
    	valorar.lodging = $hospedaje
    	valorar.reservation=$res
    	if (valorar.save)
      		flash[:success] = "Se valoro correctamente"
      		redirect_to lodgings_path
    	else
      		render 'new' 
    	end
	end

	def edit 
		@valorar=Valorateguest.new
		$hospedaje= Lodging.find(params[:id])
		$usuario= User.find(params[:us])
		$res=Reservation.find(params[:r])
    render 'new'
	end

	def update
	end

	def destroy
	end

	def show
		@valorar = Valorateguest.find(params[:id])
	end

	def index
	end
	
	private
   	def allowed_params
    params.require(:valorateguest).permit(:comentario, :calificacion)
   	end

end
