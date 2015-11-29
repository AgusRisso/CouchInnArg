class ReservationsController < ApplicationController
	def index
	end
	def show
	end

	def create
    	@reserva= Reservation.new(reservas_params)
    	@reserva.user = current_user
    	@reserva.lodging = $hospedaje
    	@reserva.confirmate=false
    	@mal=@reserva.dateinit > @reserva.dateexit
    	@tampoco=@reserva.dateinit < Date.today
    	if (@mal==true)
    		flash[:danger] = "NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
    		redirect_to lodgings_path
    	
    	 elsif @tampoco==true
    		flash[:danger] = "QUEEEE NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
    		redirect_to lodgings_path
    	
   			elsif (@reserva.save)
      			flash[:success] = "Se hizo el pedido de reserva"
      			redirect_to lodgings_path
    		else
      			render 'new'      		
    	end  
	end

	def new

	end

	def update
	end

	def edit
		$hospedaje= Lodging.find(params[:id])
		@reserva= Reservation.new
		render 'new'
	end


	private
	def reservas_params
      params.require(:reserva).permit(:dateinit, :dateexit)
  	end

end