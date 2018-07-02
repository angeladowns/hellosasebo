Rails.application.routes.draw do

  get 'contacts/new'
  resources :contacts, only: [:new, :create]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :categories
  devise_for :users
  resources :comments
  get 'pages/info'
  get 'pages/terms'
  get 'pages/privacy'




  root 'adventures#index'
  resources :adventures do
    collection do
      get :search
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
