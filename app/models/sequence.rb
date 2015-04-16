require 'radix/base'

class Sequence < ActiveRecord::Base
  belongs_to :tenant
  has_many :numbers

  validates :prefix, uniqueness: {scope: :tenant}

  def max_allowable
    "".rjust(width, decimal_to_base(base_system.values.values.max))
  end

  def next_available
    d = (numbers.maximum("decimal")||0)+1
    if d <= base_to_decimal(max_allowable).to_i
      [d, decimal_to_base(d).rjust(width, decimal_to_base(0))]
    else
      nil
    end
  end

  # Converts from decimal to the
  # base system
  def decimal_to_base(decimal)
    base_system.convert(decimal.to_s, Radix::Base.new(Radix::BASE::B10))
  end

  # Convert from the base system
  # to base 10
  def base_to_decimal(value)
    Radix::Base.new(Radix::BASE::B10).convert(value.to_s, base_system)    
  end

  def base_system
    if alphabet.blank?
      Radix::Base.new(Radix::BASE::B10)
    else
      Radix::Base.new(alphabet.scan(/./))
    end
  end
  
end
