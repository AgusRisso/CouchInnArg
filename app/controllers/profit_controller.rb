class ProfitController < ApplicationController
	def index
		flash.clear
		@users = User.search(params[:start_date],params[:end_date])
		if params[:start_date].present?
			@ok = 1
		end
		if !@users.nil?
			if params[:start_date] > params[:end_date]
				flash[:success]="La fecha inicial es mayor a la final"
			end
			if (params[:end_date]).to_date > Date.today
				flash[:danger]="La fecha final no puede ser menor a la actual"
			end
		end
	end

end
