class Admin < ApplicationRecord
  # Other Devise modules available are:
  # :confirmable, :lockable, :timeoutable, :rememberable,
  # :registerable :trackable and :omniauthable, :validatable
  devise :database_authenticatable, :recoverable
end
