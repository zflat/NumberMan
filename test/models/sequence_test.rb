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

  test "next available in sequence without numbers" do
    s = sequences(:valid_seq_no_numbers)
    assert s.numbers.empty?
    d, n_str = s.next_available
    assert_equal "00001", n_str
  end
  
  test "next available default alphabet" do
    s = sequences(:valid_seq_ok)
    d, n_str = s.next_available
    assert_equal "004", n_str
  end

  test "next available custom alphabet" do
    s = sequences(:seq_with_alphabet)
    d, n_str = s.next_available
    assert_equal "aac", n_str
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
