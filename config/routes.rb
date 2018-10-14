Rails.application.routes.draw do
  namespace :api do
    get 'images/create'
    get 'images/index'
    get 'images/destroy'
  end
  get 'images/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root to: 'home#index'

  resources :images
  namespace :api do
    resources :images
  end
end
