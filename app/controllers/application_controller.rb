class ApplicationController < ActionController::Base
  private
  def authenticate_user!
    redirect_to new_seller_session_path unless seller_signed_in?    
  end
end
