class ProfitController < ApplicationController
	def index
		@User = User.search(params[:start_date],params[:end_date])
		@ok=2
	end

end
