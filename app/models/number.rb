class Number < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :sequence

  validates :value, :decimal, uniqueness: {scope: :sequence}
end
