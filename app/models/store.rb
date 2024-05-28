# frozen_string_literal: true

class Store < ApplicationRecord
  include Stores::LogoUploader::Attachment(:logo)
  include Stores::BannerUploader::Attachment(:banner)
  include Stores::FaviconUploader::Attachment(:favicon)

  validates :status, presence: true, inclusion: { in: STORE::STATUS }
  validates :phone_number, format: { with: REGEXP::BRAZIL::PHONE_NUMBER }, allow_blank: true
  validates :email, format: { with: REGEXP::EMAIL }, allow_blank: true

  belongs_to :seller, foreign_key: :user_id, inverse_of: :store
end
