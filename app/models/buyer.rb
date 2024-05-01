class Buyer < ApplicationRecord
  include Userable

  validates :document, presence: true
end