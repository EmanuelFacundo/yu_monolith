# frozen_string_literal: true

class Seller < ApplicationRecord
  include Userable

  has_one :store, dependent: :destroy, inverse_of: :seller, foreign_key: :user_id

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, uniqueness: true, format: { with: REGEXP::EMAIL }
  validates :document, presence: true, uniqueness: true, format: { with: REGEXP::BRAZIL::CPF_OR_CNPJ }
  validates :password, presence: true, length: { minimum: 8 }, format: { with: REGEXP::PASSWORD }
  delegate :first_name, :last_name, :phone_number, to: :user, allow_nil: true

  accepts_nested_attributes_for :user

  def full_name
    "#{first_name} #{last_name}"
  end
end
