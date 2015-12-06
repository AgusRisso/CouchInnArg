class AddFechapremiumToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :fechapremium, :datetime
  end
end
