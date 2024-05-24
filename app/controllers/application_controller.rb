# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Authenticateable

  private

  def set_seller
    Current.seller = current_seller
  end
end
