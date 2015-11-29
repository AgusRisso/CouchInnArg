class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :dateinit
      t.date :dateexit
      t.boolean :confirmate
      t.integer :lodging_id
      t.integer :user_id

      t.timestamps
    end
  end
end
