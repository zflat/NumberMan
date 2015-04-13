require 'test_helper'

class SequenceTest < ActiveSupport::TestCase

  test "a correctly built sequence is valid" do
    s = sequences(:valid_seq_ok)
    assert s.valid?
  end

  

end
