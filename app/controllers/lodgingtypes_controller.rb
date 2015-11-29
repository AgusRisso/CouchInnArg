class LodgingtypesController < ApplicationController
  def index
         @lodgingtype = Lodgingtype.all
  end

  def create
     @lodgingtype = Lodgingtype.new(lodgingtype_params)
           @lodgingtype.enable=true;
          if @lodgingtype.save
             redirect_to lodgingtypes_path
          else
            render :new
          end
  end

  def new
    @lodgingtype = Lodgingtype.new
    @lodgingtype.enable=true;
    @lodgingtype.save
  end

  def edit
   @lodgingtype = Lodgingtype.find(params[:id])
  end

  def show
    @lodgingtype = Lodgingtype.find(params[:id])

  end

  def update
    @lodgingtype = Lodgingtype.find(params[:id])
    if @lodgingtype.update(lodgingtype_params)
      redirect_to lodgingtypes_path
    else
      render :edit
    end
  end


  def destroy
    lodgingtype = Lodgingtype.find(params[:id])

     if  lodgingtype.lodgings.count == 0
        lodgingtype.destroy
        lodgingtype.save
        redirect_to lodgingtypes_path
      else
        lodgingtype.enable=false
        lodgingtype.save
        flash[:danger] = "El tipo de hospedaje borrado contiene hospedajes existentes. Estos apareceran a la hora de buscar por esta categoría"
        redirect_to lodgingtypes_path
      end
  end


  def recuperar
    lodgingtype = Lodgingtype.find(params[:id])
    lodgingtype.enable=true
    lodgingtype.save
    redirect_to lodgingtypes_path
  end


  def lodgingtype_params
      params.require(:lodgingtype).permit(:tipo)
  end

end
