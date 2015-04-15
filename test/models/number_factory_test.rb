require 'test_helper'

class NumberFactoryTest < ActiveSupport::TestCase

  test "create with valid params" do
    desc = %w(a b c d e f).sample*(1+rand(9))
    seq_id = sequences(:valid_seq_ok).id
    params = {descriptor: desc, sequence_id: seq_id}

    factory = NumberFactory.new(params)
    refute_nil factory
    n = factory.create
    refute_nil n
  end

  test "create with invalid sequence" do
    desc = %w(a b c d e f).sample*(1+rand(9))
    
    params = {descriptor: desc, sequence_id: 0}
    factory = NumberFactory.new(params)
    refute_nil factory
    n = factory.create
    assert_nil n
    refute factory.errors.empty?
  end

end
