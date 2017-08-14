class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :access_token 

  
  def clear_temporary_authentication_token
     self.access_token.delete if self.access_token.present?
  end           
end
