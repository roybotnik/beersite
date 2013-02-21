Rails3BootstrapDeviseCancan::Application.routes.draw do
  get "breweries/new"

  get "beers/new"

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  resources :breweries
  resources :beers
end