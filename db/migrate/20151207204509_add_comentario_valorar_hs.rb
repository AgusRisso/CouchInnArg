class AddComentarioValorarHs < ActiveRecord::Migration
  def change
  	add_column :lodgings, :urldos, :string
	add_column :lodgings, :urltres, :string
	add_column :lodgings, :urlcuatro, :string
	add_column :valorar_hs, :comentario, :text
	add_column :reservations, :rechazado, :boolean, default: false
  end
end
