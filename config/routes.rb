Rails.application.routes.draw do
  devise_for :sellers

  root to: "home#index"
end
