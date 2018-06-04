class Message::SpecRunner
  DISPLAY_CODE_REGEX = /(\$\${[^}]*\})/ # e.g. $${foo}
  INTERPOLATION_REGEX = /((?<!\$)\${[^}]*\})/ # e.g. ${foo}

  def initialize(string)
    self.string = string
  end

  def run
    # Disassemble the string
    array_of_substrings.map do |substring|
      if interpolate_code?(substring)
        recursively_interpolate(substring) # Interpolate if necessary
      elsif display_code?(substring)
        present_as_code(substring) # Leave code samples as-is
      else
        substring # Otherwise, leave alone
      end
    end.join()
    # Re-assemble the string
  end

  private

  attr_accessor :string

  def array_of_substrings
    # Create an array with two types of substrings:
    # 1. interpolatable values
    # 2. everything else
    string.split(INTERPOLATION_REGEX)
  end

  def display_code?(substring)
    # e.g. "$${no-interpolation}"
    substring.match(DISPLAY_CODE_REGEX)
  end

  def find_message_spec_by(substring)
    # Return the spec of Message in DB with matching name, or nil if none exists
    Message.find_by_name(substring).try(:spec)
  end

  def interpolate_code?(substring)
    # e.g. "${interpolation}"
    substring.match(INTERPOLATION_REGEX)
  end

  def message_name(substring)
    # Return the value in between `${` and `}`
    substring[2..-2]
  end

  def present_as_code(substring)
    # Remove the first dollar sign
    substring.gsub('$$', '$')
  end

  def recursively_interpolate(substring)
    spec = find_message_spec_by(message_name(substring))

    # If spec exists in db, return its output and the output of all referenced specs, infinitely.
    # Otherwise return substring as-is.
    spec ? Message::SpecRunner.new(spec).run : substring
  end
end
