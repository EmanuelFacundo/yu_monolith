# frozen_string_literal: true

module Sellers
  class RegistrationsController < Devise::RegistrationsController
    include Authenticateable
    before_action :redirect_when_already_signed_in, only: %i[new create]

    # GET /sellers/sign_up
    # def new
    #   super
    # end

    # POST /sellers
    def create
      super

      if resource.persisted?
        Current.seller = resource

        flash[:notice] = t('sellers.registrations.signed_up', full_name: resource.full_name)
      else
        flash.now[:alert] = t('sellers.registrations.signed_up_failed')
      end
    end

    # GET /sellers/edit
    # def edit
    #   super
    # end

    # PUT /sellers
    # def update
    #   super
    # end

    # DELETE /sellers
    # def destroy
    #   super
    # end

    private

    def sign_up_params
      params.require(:seller).permit(:email, :password, :password_confirmation, :document, user_attributes: %i[first_name last_name phone_number])
    end

    def redirect_when_already_signed_in
      redirect_to request.referrer, alert: t('sellers.already_signed_in') if seller_signed_in?
    end

    def after_sign_up_path_for(_resource = nil)
      return sellers_dashboard_root_url if request.referrer == new_seller_registration_url

      request.referrer
    end
  end
end
