class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :recoverable, :validatable, :registerable,
  devise :database_authenticatable, :rememberable, :trackable

  belongs_to :tenant
end
