require_relative './test_config'

class MyTest < JustJobTest
  def test_I_can_add
    assert_equal 2, 1 + 1
  end
end
