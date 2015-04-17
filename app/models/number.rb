class Number < ActiveRecord::Base

  belongs_to :sequence
  has_one :tenant, through: :sequence

  validates :value, :decimal, uniqueness: {scope: :sequence}

  def to_s
    "#{sequence.prefix}#{sequence.delimiter}#{value}"
  end
end
