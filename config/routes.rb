# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", :as => :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", :as => :pwa_manifest

  # Defines the root path route ("/")
  root "recipes#index"

  resources :recipes do
    collection do
      get "by_category/:category", action: :by_category, as: :by_category
    end

    member do
      get :edit_name
      patch :update_name
      get :edit_instructions
      patch :update_instructions
      patch :update_category
      get :edit_image
      patch :update_image
      delete :remove_image
    end

    resources :ingredients, only: %i[new create edit update destroy], module: :recipes
  end

  resources :products
end
