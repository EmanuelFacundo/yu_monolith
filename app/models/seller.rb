# frozen_string_literal: true

class Seller < ApplicationRecord
  include Userable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
