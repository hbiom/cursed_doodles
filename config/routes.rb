Rails.application.routes.draw do

  root to: 'pages#home'

  resources :events, only: [:new, :create, :show] do
    resources :users, only: [:new, :create]
  end

  resources :users, only: [:new, :create] do
    resources :uptimes, only: [:new, :create]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
