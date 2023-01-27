require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  resources :machines
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


  resources :notifications, only: [:index], export: true
  resources :announcements, only: [:index], export: true
  root to: 'home#index'
end
