require 'minitest/autorun'
require_relative 'main'

class ShortestSubstring < Minitest::Test
  def test_shortest_substring
    assert_equal 2,  shortest_substring('bab')
    assert_equal 13, shortest_substring('asdfkjeghfalawefhaef')
    assert_equal 4,  shortest_substring('abcd')
    assert_equal 4,  shortest_substring('abbc')
  end

  def test_shortest_substring__constraints
    # 1 ≤ s.size ≤ 105
    assert_raises(StandardError) { shortest_substring('a') }
    assert_raises(StandardError) { shortest_substring('a' * 105) }

    # Only allow ASCII[a-z] characters
    assert_raises(StandardError) { shortest_substring('a!') }
  end
end
