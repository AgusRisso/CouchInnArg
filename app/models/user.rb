class User < ActiveRecord::Base
  has_many :lodgings, dependent: :destroy
  has_many :valorarHs, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :valorateguests, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   validates_format_of :name, :apellido, with: /\A[a-zA-Z]+\z/,
    message: ":Sólo letras permitidas"
    
   validates_presence_of :name, :apellido, :edad, message: ":Es requerido/a"
   
   def self.search(start_date,end_date)

   		users = nil
   		
      if !start_date.blank? && !end_date.blank?
   			users = User.where(["fechapremium BETWEEN ? AND ?",start_date,end_date])
   		end
      
      return users 

   end
end
