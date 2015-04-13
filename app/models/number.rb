class Number < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :sequence

  validates :value, uniqueness: {scope: :prefix}
end
