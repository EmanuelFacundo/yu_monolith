# frozen_string_literal: true

class Store < ApplicationRecord
  validates :status, presence: true
  validates :phone_number, format: { with: REGEXP::BRAZIL::PHONE_NUMBER }, allow_blank: true
  validates :email, format: { with: REGEXP::EMAIL }, allow_blank: true

  belongs_to :seller, foreign_key: :user_id, inverse_of: :store
end
