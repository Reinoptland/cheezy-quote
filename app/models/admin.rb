class Admin < ApplicationRecord
  # Other Devise modules available are:
  # :confirmable, , :timeoutable, :rememberable, :lockable
  # :registerable :trackable and :omniauthable, :validatable


  devise :database_authenticatable, :recoverable
end
