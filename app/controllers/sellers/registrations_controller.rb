# frozen_string_literal: true

class Sellers::RegistrationsController < Devise::RegistrationsController
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
      User.create!(create_user_params)

      flash[:notice] = t("sellers.registrations.signed_up", full_name: resource.full_name)
    else
      flash[:alert] = t("sellers.registrations.signed_up_failed")
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
  def create_user_params
    params.require(:seller).permit(:first_name, :last_name, :phone_number).merge(userable: Current.seller)
  end

  def redirect_when_already_signed_in
    redirect_to request.referrer, alert: t("sellers.already_signed_in") if seller_signed_in?
  end
end
