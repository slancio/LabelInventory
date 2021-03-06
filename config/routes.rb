Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]
  resource :session, only: [:create, :new]
  delete 'session' => 'sessions#destroy', :as => 'logout'

  resources :bands
  resources :albums, except: [:index]
  resources :tracks, except: [:index] do
    resources :notes, only: [:create, :destroy]
  end

  root 'sessions#new'
end