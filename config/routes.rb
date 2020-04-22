Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :concerts, only: [:index, :show] do
    resources :participations, only: [:create, :destroy]
  end

  resources :participations, only: [:index]

  resources :my_concerts, only: [:new, :create, :edit, :update, :show, :index] do
    member do
      post :duplicate
    end
  end

  resources :locations, only: [:index]

  resources :bands, only: [:show, :new, :create]

  resources :profiles, only: [:show, :update, :edit]
end
