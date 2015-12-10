class LodgingsController < ApplicationController
   before_filter :authenticate_user!, except: [:show, :index] 

  def create
    @user = current_user
    @lodgings= Lodging.new(allowed_params)
    @lodgings.user=current_user

    if (@lodgings.save)
      flash[:success] = "Se creo el nuevo hospedaje"
      redirect_to mostrar_lodging_path(current_user.lodgings)
    else
      render 'new'
    end
  end

  def new
    @lodgings= Lodging.new
  end 


  def index
    flash.clear
    @lodgings = Lodging.search(params[:search_titulo], params[:search_cant], params[:search_tipo_id],params[:search_zona],params[:start_date],params[:end_date])
    if params[:search_titulo].present? || params[:search_cant].present? || params[:search_tipo_id].present? || params[:search_zona].present? || params[:start_date].present? || params[:end_date].present?
      @ok = 1
        if params[:start_date] >= params[:end_date]
          flash[:success]="La fecha inicial nunca puede ser mayor o igual a la final"
        end
    end
  end

   def edit
   @lodging = Lodging.find(params[:id])
  end

  def update
    @lodging = Lodging.find(params[:id])
    if @lodging.update(allowed_params)
      render :mostrar
    else
      render :edit
    end
  end

  def show
    @lodgings = Lodging.find(params[:id])
  end


def destroy
        @lodgings = Lodging.find(params[:id])
        @rech=@lodgings.reservations.where(:rechazado => false).count
        @conf=@lodgings.reservations.where(:confirmate => true).count
        @confirmadasentransicion=0
        @lodgings.reservations.each do |reserva|
          if reserva.confirmate == true
            if (Date.today<=reserva.dateexit)
              @confirmadasentransicion=1
            end
          end
        end
        @rechh=@rech-@conf
        if (@rech==0 && @conf== 0 && @confirmadasentransicion==0)
            @lodgings.destroy
            flash[:success] = "Se elimino correctamente el hospedaje"
            redirect_to mostrar_lodging_path(current_user.lodgings)
        elsif @confirmadasentransicion==1
            flash[:danger] = "Este hospedaje posee reservas en transicion, no puede ser eliminado"
            redirect_to mostrar_lodging_path(current_user.lodgings)
        elsif (@rechh==0 && @conf!=0)
            @lodgings.destroy
            flash[:success] = "Se elimino correctamente el hospedaje, que posee reservas caducadas"
            redirect_to mostrar_lodging_path(current_user.lodgings)
        else
          flash[:danger] = "Este hospedaje posee reservas pendientes, no puede ser eliminado"
          redirect_to mostrar_lodging_path(current_user.lodgings)
        end
    end

    def mostrar
      
    end

    def reservas
       @lodging = Lodging.find(params[:id])
    end

    def confirmadas
       @lodging = Lodging.find(params[:id])
    end


 private
  def allowed_params
    params.require(:lodging).permit(:titulo, :descripcion, :detalle, :zona, :url, :urldos, :urltres, :urlcuatro, :lodgingtype_id, :cantidaddehuespedes)
  end
end
