class AddLodgingtypeIdLodgings < ActiveRecord::Migration
  def change
  	add_column :lodgings, :lodgingtype_id, :integer
  end
end
