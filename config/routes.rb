Rails.application.routes.draw do
  devise_for :users
  resources :profiles do
    resources :socials
  end
  namespace :profile do
    resources :socials
  end
  # get 'home/index'
  root "profiles#index"
end
