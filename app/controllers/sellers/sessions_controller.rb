# frozen_string_literal: true

module Sellers
  class SessionsController < Devise::SessionsController
    before_action :redirect_when_already_signed_in, only: %i[new create]

    # GET /sellers/sign_in
    # def new
    #   super
    # end

    # POST /sellers/sign_in
    def create
      super
      Current.seller = resource if seller_signed_in?
    end

    # DELETE /sellers/sign_out
    # def destroy
    #   super
    # end

    private

    def redirect_when_already_signed_in
      redirect_to request.referrer, alert: t('sellers.already_signed_in') if seller_signed_in?
    end
  end
end
