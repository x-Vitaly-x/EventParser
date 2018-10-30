Rails.application.routes.draw do
  namespace :api do
    get 'event_infos/index'
  end
  get 'images/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root to: 'home#index'

  namespace :api do
    resources :event_infos
  end
end
