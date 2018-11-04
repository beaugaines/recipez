Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :users, only: [:show] do
    resources :recipes
  end
  authenticated :user do
    root 'recipes#index'
  end
  root 'home#index'
end
