class PremiumsController < ApplicationController
	def edit
		@user= User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if@user.es_premium!=true
			r = (rand*10).to_i
			if r > 5
	    	  	@user.es_premium=true
	    	  	@user.fechapremium=Date.today
	    	  	flash[:success] = "Tarjeta valida"
	    	  	if @user.update(user_params)
	    	  		redirect_to root_path
   		 		else
      				render :edit
    			end
			else
				flash[:success] = "Tarjeta invalida"
				render :edit
			end
		end
	end

    private
	def user_params
      params.require(:user).permit(:tarjeta, :pintarjeta, :dueñotarjeta)
  	end

end
