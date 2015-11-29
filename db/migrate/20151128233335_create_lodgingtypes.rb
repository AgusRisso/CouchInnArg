class CreateLodgingtypes < ActiveRecord::Migration
  def change
    create_table :lodgingtypes do |t|
      t.string :tipo
      t.boolean :enable

      t.timestamps
    end
  end
end
