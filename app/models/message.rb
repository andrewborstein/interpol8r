class Message < ApplicationRecord
  SLUG_REGEX = /\A[a-z-]+[a-z]+\z/

  validates :name,
    format: {
      with: SLUG_REGEX,
      message: 'can only contain lowercase letters and dashes'
    },
    length: { maximum: 25 },
    presence: true,
    uniqueness: true
  validates :spec,
    length: { maximum: 250 },
    presence: true

  def output
    Message::SpecRunner.new(spec).run
  end
end
