require 'test_helper'

class TenantTest < ActiveSupport::TestCase

  test "verify valid is valid tenant" do
    t = tenants(:valid_tenant)
    assert t.valid?
  end

  test "tennant associations" do
    t = tenants(:valid_tenant)

    refute t.sequences.empty?
    refute t.numbers.empty?

    assert t.numbers.count>0
  end

end
