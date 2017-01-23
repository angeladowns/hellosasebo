Rails.application.routes.draw do
  resources :comments
  get 'pages/info'

  root 'adventures#index'
  resources :adventures
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
