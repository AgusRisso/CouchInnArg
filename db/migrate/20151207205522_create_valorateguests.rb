class CreateValorateguests < ActiveRecord::Migration
  def change
    create_table :valorateguests do |t|
      t.integer :user_id
      t.integer :lodging_id
      t.text :comentario
      t.integer :calificacion
      t.integer :reserva_id

      t.timestamps
    end
  end
end
