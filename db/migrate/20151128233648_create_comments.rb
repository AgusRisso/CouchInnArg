class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comentario
      t.text :respuesta
      t.text :lodging_id
      t.text :user_id

      t.timestamps
    end
  end
end
