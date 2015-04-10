class Number < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :prefix

  validates :value, uniqueness: {scope: :prefix}
end
