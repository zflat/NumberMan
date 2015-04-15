class Tenant < ActiveRecord::Base

  has_many :sequences
  has_many :numbers
  
end
