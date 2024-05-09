# frozen_string_literal: true

class Buyer < ApplicationRecord
  include Userable

  validates :document, presence: true, uniqueness: true
  delegate :first_name, :last_name, :phone_number, to: :user, allow_nil: true
end
