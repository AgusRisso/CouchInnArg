class AddDatosUsers2 < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :is_female, :boolean, default: false
    add_column :users, :date_of_birth, :datetime
  end
end
