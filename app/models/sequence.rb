require 'radix/base'

class Sequence < ActiveRecord::Base
  belongs_to :tenant
  has_many :numbers

  validates :prefix, uniqueness: {scope: :tenant}

  def max_allowable
    "".rjust(width, to_base(base_system.values.values.max))
  end

  def next_available
    max = numbers.maximum("decimal")
    if max < to_decimal(max_allowable).to_i
      to_base(max+1).rjust(width, to_base(0))
    else
      nil
    end
  end

  # Converts from decimal to the
  # base system
  def to_base(decimal)
    base_system.convert(decimal.to_s, Radix::Base.new(Radix::BASE::B10))
  end

  # Convert from the base system
  # to base 10
  def to_decimal(value)
    Radix::Base.new(Radix::BASE::B10).convert(value.to_s, base_system)    
  end

  def base_system
    if alphabet.nil?
      Radix::Base.new(Radix::BASE::B10)
    else
      Radix::Base.new(alphabet.scan(/./))
    end
  end
  
end
