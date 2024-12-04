Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    delete 'users/avatar', to: 'users/registrations#delete_avatar', as: 'delete_user_avatar'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # 利用規約ページへのルートを追加
  get 'terms_of_service', to: 'shared#terms_of_service', as: :terms_of_service

  get 'map', to: "shops#map", as: :map_shops

  # Defines the root path route ("/")
  root "tops#index"

  resources :shops do
    resources :reviews, only: %i[new edit create destroy], shallow: true
    member do
      post 'favorite', to: 'favorites#create'
      delete 'favorite', to: 'favorites#destroy'
    end
    collection do
      get :autocomplete
      get :favorites
      get :search
    end
  end

  resources :users, only: %i[show edit update destroy] do
    member do
      get 'delete_avatar'
    end
  end

  namespace :admin do
    root "dashboards#index"
    resource :dashboard, only: %i[index]
    resources :users do
      member do
        delete 'destroy_avatar', to: 'users#destroy_avatar', as: :destroy_avatar
      end
    end
    resources :shops do
      member do
        delete 'destroy_image', to: 'admin/shops#destroy_image', as: :destroy_image
      end
    end
    get 'login' => 'sessions#new', :as => :login
    post 'login' => "sessions#create"
    delete 'logout' => 'sessions#destroy', :as => :logout
  end

  # namespace :api do
  #   resources :shops, only: [:index]
  # end

  # 開発環境のみで LetterOpenerWeb
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
