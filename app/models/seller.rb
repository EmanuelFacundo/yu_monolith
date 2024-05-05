# frozen_string_literal: true

class Seller < ApplicationRecord
  include Userable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, uniqueness: true
  validates :document, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%\^&\*])/ }
  delegate :first_name, :last_name, :phone_number, to: :user, allow_nil: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
