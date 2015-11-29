class CreateLodgings < ActiveRecord::Migration
  def change
    create_table :lodgings do |t|
      t.string :titulo
      t.text :descripcion
      t.text :detalle
      t.string :zona
      t.string :url
      t.integer :user_id
      t.integer :cantidaddehuespedes

      t.timestamps
    end
  end
end
