# frozen_string_literal: true

class User < ApplicationRecord
  delegated_type :userable, types: %w[Buyer Seller], dependent: :destroy

  validates :first_name, :last_name, :phone_number, presence: true
end
