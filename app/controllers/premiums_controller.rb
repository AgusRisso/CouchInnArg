class PremiumsController < ApplicationController
	def edit
		@user= User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if@user.es_premium!=true
			@user.es_premium=true
		end
   	 	if @user.update(user_params)
    	  	redirect_to root_path
   		 else
      		render :edit
    	end
	end

    private
	def user_params
      params.require(:user).permit(:tarjeta, :pintarjeta, :dueñotarjeta)
  	end

end
