require 'test_helper'

class StringInterpolatorTest < ActiveSupport::TestCase
  # When spec is plain string with no interpolation characters
  test "should return string as-is" do
    string = 'Hello, world.'
    output = StringInterpolator.new('Hello, world.').interpolate

    assert_equal string, output
  end
end
