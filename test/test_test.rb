True = false

class TestTest < Test::Unit::TestCase
  def test_truth
    assert_equal true, true
    assert_equal True, false
  end
end