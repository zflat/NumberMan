class NumberFactory
  include ActiveModel::Validations

  attr_reader :sequence, :params, :number

  validates_each :sequence do |record, attr, value|
    if value.nil?
      record.errors.add attr, 'not specified'
    end
  end

  def initialize(arg_params)
    @params = arg_params
    @sequence = Sequence.where(id: params[:sequence_id]).first
  end

  def create
    if valid?
      @number = sequence.numbers.create(new_number_params)
    end
  end

  private
  def new_number_params
    dec, val = sequence.next_available
    tenant = sequence.tenant
    params.merge({decimal: dec, value: val, tenant: tenant})
  end

end
