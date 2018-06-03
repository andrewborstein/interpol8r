class StringInterpolator
  INTERPOLATION_REGEX = /(\${[^}]*\})/

  attr_accessor :string

  def initialize(string)
    self.string = string
  end

  def interpolate
    array_of_substrings.map do |str|
      interpolate?(str) ? re_interpolate(str) : str
    end.join()
  end

  private

  def array_of_substrings
    # Create an array with two types of substrings:
    # 1. interpolatable values, e.g. "#{message-name}"
    # 2. everything else, e.g. "random string of text "
    string.split(INTERPOLATION_REGEX)
  end

  def interpolate?(str)
    str.match(INTERPOLATION_REGEX)
  end

  def message_name(str)
    # Return the value in between `${` and `}`
    str[2..-2]
  end

  def find_message_spec_by(str)
    Message.find_by_name(str).try(:spec)
  end

  def re_interpolate(str)
    value = find_message_spec_by(message_name(str))

    value ? StringInterpolator.new(value).interpolate : str
  end
end
