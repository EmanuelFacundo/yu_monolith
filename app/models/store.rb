# frozen_string_literal: true

class Store < ApplicationRecord
  validates :status, presence: true

  belongs_to :seller, foreign_key: :user_id, inverse_of: :store
end
