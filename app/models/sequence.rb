class Sequence < ActiveRecord::Base
  belongs_to :tenant

  validates :prefix, uniqueness: {scope: :tenant}
  
end
