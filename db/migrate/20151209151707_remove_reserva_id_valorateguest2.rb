class RemoveReservaIdValorateguest2 < ActiveRecord::Migration
  def change
  	  	add_column :valorateguests, :reservation_id, :integer
  end
end
