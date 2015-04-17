require 'test_helper'

class NumberTest < ActiveSupport::TestCase

  test "#to_s with fully valid" do
    n = numbers(:number_one_w3)
    assert_equal n.sequence.width+n.sequence.prefix.length+n.sequence.delimiter.length, n.to_s.length
    refute_nil n.to_s

    refute_nil n.tenant
  end

  test "#to_s without a prefix" do
    n = numbers(:number_without_prefix)
    refute_nil n.to_s
  end

  test "#to_s without a delimiter" do
    n = numbers(:number_without_delimiter)
    refute_nil n.to_s
  end
end
