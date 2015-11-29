class AddDatosValorarh < ActiveRecord::Migration
  def change
  	add_column :valorar_hs, :user_id, :integer
  	add_column :valorar_hs, :lodging_id, :integer
  	add_column :valorar_hs, :promedio, :float
  	add_column :valorar_hs, :cantidaddevotos, :integer
  end
end
