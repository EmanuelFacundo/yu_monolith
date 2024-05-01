# frozen_string_literal: true

class Userable
  extend ActiveSupport::Concern

  included do
    has_one :user, as: :userable, touch: true, dependent: :destroy
  end
end