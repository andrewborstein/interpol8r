class Message < ApplicationRecord
  SLUG_REGEX = /\A[a-z-]+[a-z]+\z/

  validates :name,
    uniqueness: true,
    format: {
      with: SLUG_REGEX,
      message: "can only contain lowercase letters and dashes"
    }
end
