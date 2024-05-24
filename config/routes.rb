# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :sellers, controllers: {
    registrations: 'sellers/registrations',
    sessions: 'sellers/sessions'
  }

  root to: 'home#index'
  namespace :stores do
    resources :registrations, only: %i[new create]
  end
end
