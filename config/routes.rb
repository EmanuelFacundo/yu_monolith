Rails.application.routes.draw do
  devise_for :sellers, controllers: {
    registrations: "sellers/registrations"
  }

  root to: "home#index"
end
