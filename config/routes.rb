Rails.application.routes.draw do
  devise_for :users

  root 'users#index'

  resources :users

  resources :similar_artists

  namespace :api do #, :defaults => {:format => :json} do
  	resources :users
  end

end
