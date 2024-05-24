# frozen_string_literal: true

module Stores
  class ApplicationController < ActionController::Base
    include Authenticateable

    before_action :authenticate_seller!
    before_action :set_seller

    private

    def set_seller
      Current.seller = current_seller
    end
  end
end
