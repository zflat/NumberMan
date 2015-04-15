require 'test_helper'

class SequenceTest < ActiveSupport::TestCase

  test "a correctly built sequence is valid" do
    s = sequences(:valid_seq_ok)
    assert s.valid?
  end

  test "a sequence with numbers" do
    s = sequences(:valid_seq_ok)
    refute s.numbers.empty?
  end

  test "convert to custom base" do
    base_characters =  'abcdefghij'.scan(/./)
    s = sequences(:seq_with_alphabet)
    refute_nil s.base_system
    
    assert_equal s.to_base(10), "10".b(10).to_a(base_characters).join
    assert_equal 'ba', s.to_base('10')
  end

  test "convert to default base" do
    s = sequences(:seq_without_alphabet)
    refute_nil s.base_system
    
    assert_equal s.to_base(10), "10"
  end
  
  test "next available default alphabet" do
    s = sequences(:valid_seq_ok)
    assert_equal "004", s.next_available
  end

  test "next available custom alphabet" do
    s = sequences(:seq_with_alphabet)
    assert_equal "aac", s.next_available
  end

  test "maxed allowable with custom alphabet" do
    s = sequences(:seq_with_alphabet)
    assert_equal "jjj", s.max_allowable
  end

  test "next available maxed out" do
    s = sequences(:seq_fully_maxed_out)
    assert_equal 'j', s.max_allowable
    assert_nil s.next_available
  end
end
