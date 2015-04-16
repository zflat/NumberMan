class Number < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :sequence

  validates :value, :decimal, uniqueness: {scope: :sequence}

  def to_s
    "#{sequence.prefix}#{sequence.delimiter}#{value}"
  end
end
