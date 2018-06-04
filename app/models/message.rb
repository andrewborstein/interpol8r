class Message < ApplicationRecord
  SLUG_REGEX = /\A[a-z-]+[a-z]+\z/

  validates :name,
    format: {
      with: SLUG_REGEX,
      message: 'can only contain lowercase letters and dashes'
    },
    length: 50,
    uniqueness: true
  validates :spec, length: 250

  def output
    Message::SpecRunner.new(spec).run
  end
end
