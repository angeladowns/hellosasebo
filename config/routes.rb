Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :categories
  devise_for :users
  resources :comments
  get 'pages/info'
  get 'pages/sasebo'
  get 'pages/fukuoka'
  get 'pages/nagasaki'
  get 'pages/osaka'
  get 'pages/tokyo'

  root 'adventures#index'
  resources :adventures do
    collection do
      get :search
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
