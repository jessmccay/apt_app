class User < ApplicationRecord
  rolify
  has_many :apartments #add this line
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :assign_role
# after a new user is created assign them the renter role
  def assign_role
    add_role(:renter)
  end
end
