# frozen_string_literal: true

module Authenticateable
  extend ActiveSupport::Concern

  included do
    protect_from_forgery
  end

  private

  def authenticate_seller!
    redirect_to new_seller_session_path unless seller_signed_in?
  end
end
