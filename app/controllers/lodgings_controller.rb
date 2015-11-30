class LodgingsController < ApplicationController
   before_filter :authenticate_user!, except: [:show, :index] 

  def create
    @user = current_user
    @lodgings= Lodging.new(allowed_params)
    @lodgings.user=current_user

    if (@lodgings.save)
      flash[:success] = "Se creo el nuevo hospedaje"
      redirect_to lodgings_path
    else
      render 'new'
    end
  end

  def new
    @lodgings= Lodging.new
  end 


  def index
    @lodgings = Lodging.all
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
        if @lodgings.reservations.count==0
          if @lodgings.user == current_user
            @lodgings.destroy
            flash[:success] = "Se elimino correctamente el hospedaje"
            redirect_to lodgings_path
          else
            redirect_to lodgings_path
          end
        else
            flash[:danger] = "Este hospedaje posee reservas pendientes no puede ser eliminado"
            redirect_to lodgings_path
        end
    end

    def mostrar
      
    end


 private
  def allowed_params
    params.require(:lodging).permit(:titulo, :descripcion, :detalle, :zona, :url, :lodgingtype_id, :cantidaddehuespedes)
  end

end
