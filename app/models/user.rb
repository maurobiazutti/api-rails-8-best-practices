
class User < ActiveRecord::Base
  has_many :contacts, dependent: :destroy

  extend Devise::Models
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable  and :omniauthable
  devise :database_authenticatable,
         :confirmable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable
  include DeviseTokenAuth::Concerns::User
end
