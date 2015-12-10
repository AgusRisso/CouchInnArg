class RemoveReservaIdValorateguest < ActiveRecord::Migration
  def change
  	add_column :valorar_hs, :reservation_id, :integer
  end
end
