require 'test_helper'

class Message::SpecRunnerTest < ActiveSupport::TestCase
  setup do
    Message.create(name: 'hello', spec: 'Hey there')
    Message.create(name: 'world', spec: 'Earth')
    Message.create(name: 'hello-world', spec: '${hello}, ${world}.')
    Message.create(name: 'hello-hello-world', spec: "${hello-world} It's ya boy, Mars." )
  end

  # When spec is plain string with no interpolation characters
  test "should return string as-is" do
    string = "Hello, world."
    output = Message::SpecRunner.new(string).run

    assert_equal string, output
  end

  # When spec is string with interpolation characters that are escaped
  test "should return string as-is, but without extra dollar signs" do
    string = "To return '${hello-world}', write $${hello-world}."
    output = Message::SpecRunner.new(string).run

    assert_equal "To return 'Hey there, Earth.', write ${hello-world}.", output
  end

  # When spec contains interpolatable value

    # with no associated Message
    test "should return string as-is, with interpolatable value unchanged" do
      string = "Hello, ${place}."
      output = Message::SpecRunner.new(string).run

      assert_equal "Hello, ${place}.", output
    end

    # with associated Message

      # that references a plain string
      test "should return interpolated string based on all Messages in DB" do
        string = "${hello}, ${world}."
        output = Message::SpecRunner.new(string).run

        assert_equal "Hey there, Earth.", output
      end

      # that references another Message
      test "should return recursively interpolated string based on all Messages in DB" do
        string = "${hello-world} It's ya boy ${world}."
        output = Message::SpecRunner.new(string).run

        assert_equal "Hey there, Earth. It's ya boy Earth.", output
      end

      # that references another Message that references another message
      test "should return doubly recursive interpolated string based on all Messages in DB" do
        string = "${hello-hello-world} I'm hot =/"
        output = Message::SpecRunner.new(string).run

        assert_equal "Hey there, Earth. It's ya boy, Mars. I'm hot =/", output
      end

      # with interpolatable value nested inside interpolation characters
      test "should return string as-is, with doubly-interpolated value unchanged" do
        string = "Hello, ${${world}}."
        output = Message::SpecRunner.new(string).run

        assert_equal "Hello, ${${world}}.", output
      end
end
