require "uuidtools"

class TenantFactory
  
  attr_reader :params

  def initialize(given_params)
    @params=given_params
  end

  def build
    Tenant.new(merged_params)
  end

  def create
    Tenant.create(merged_params)
  end

  private

  def merged_params
    params.merge({access_key: UUIDTools::UUID.random_create})
  end
end
