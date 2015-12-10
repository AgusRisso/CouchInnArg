class ReservationsController < ApplicationController
	def index
     @reservas=Reservation.all
	end
	def show
	end

	def create
      @reserva= Reservation.new(reservas_params)
      @reserva.user = current_user
      @reserva.lodging = $hospedaje
      @reserva.confirmate=false
      @mal=@reserva.dateinit >= @reserva.dateexit
      @tampoco=@reserva.dateinit < Date.today
      if (@mal==true)
        flash[:danger] = "Error, Usted a ingresado una fecha de entrada superior/igual a la de salida"
        redirect_to lodgings_path
      
       elsif @tampoco==true
        flash[:danger] = "Error, usted ingreso una fecha de ingreso inferior a la actual"
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

  def actualizar
    reserva = Reservation.find(params[:id])
    reserva.confirmate=params[:confirmate]
    reserva.rechazado=params[:rechazado]
    if reserva.save
      redirect_to mostrar_lodging_path
    else
      redirect_to reservas_lodging_path
    end
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
      params.require(:reservation).permit(:dateinit, :dateexit)
  	end

end
