require 'test_helper'

class StringInterpolaterTest < ActiveSupport::TestCase
  setup do
    @message = messages(:one)
    @output = StringInterpolater.new(@message.spec)
  end

  # When spec is plain string with no interpolation characters
  test "should return string as-is" do
    assert_equal @message.spec, @output
  end
end
