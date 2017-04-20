Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :groups, only: [:new, :edit, :create] do
    resources :messages, only: [:index]
  end
end
