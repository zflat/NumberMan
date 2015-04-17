class Tenant < ActiveRecord::Base

  has_many :sequences
  has_many :numbers, through: :sequences
  
end
