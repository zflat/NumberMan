class Tenant < ActiveRecord::Base

  has_many :sequences
  
end
