require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test 'output' do
    Message.create(name: 'tasty-food', spec: 'donuts')
    message = Message.create(name: 'confession', spec: 'I like ${tasty-food}')

    assert_equal 'I like donuts', message.output
  end
end
