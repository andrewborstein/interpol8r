class StringInterpolator
  def initialize(string)
    self.string = interpolate
  end

  def interpolate
    # For now, just return the string as-is
    string
  end

  private

  attr_accessor :string
end
