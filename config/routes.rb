Rails.application.routes.draw do
  devise_for :users
  resources :comments
  get 'pages/info'
  get 'pages/sasebo'
  get 'pages/fukuoka'
  get 'pages/nagasaki'
  get 'pages/osaka'
  get 'pages/tokyo'

  root 'adventures#index'
  resources :adventures
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
