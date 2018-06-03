class Message::SpecRunner
  INTERPOLATION_REGEX = /((?<!\$)\${[^}]*\})/ # e.g. ${foo}
  DISPLAY_CODE_REGEX = /(\$\${[^}]*\})/ # e.g. $${foo}

  attr_accessor :string

  def initialize(string)
    self.string = string
  end

  def interpolate
    array_of_substrings.map do |str|
      if interpolate?(str)
        re_interpolate(str)
      elsif display_code?(str)
        str.gsub('$$', '$')
      else
        str
      end
    end.join()
  end

  private

  def array_of_substrings
    # Create an array with two types of substrings:
    # 1. interpolatable values, e.g. "${message-name}"
    # 2. everything else, e.g. "random text" or "$${no-interpolation}"
    string.split(INTERPOLATION_REGEX)
  end

  def display_code?(str)
    str.match(DISPLAY_CODE_REGEX)
  end

  def find_message_spec_by(str)
    Message.find_by_name(str).try(:spec)
  end

  def interpolate?(str)
    str.match(INTERPOLATION_REGEX)
  end

  def message_name(str)
    # Return the value in between `${` and `}`
    str[2..-2]
  end

  def re_interpolate(str)
    value = find_message_spec_by(message_name(str))

    value ? Message::SpecRunner.new(value).interpolate : str
  end
end
