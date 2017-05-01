Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :groups, except: [:show, :destroy] do
    resources :messages, only: [:index, :create]
  end
  root 'groups#index'
end
