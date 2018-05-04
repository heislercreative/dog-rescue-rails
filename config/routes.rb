Rails.application.routes.draw do

  get 'signup' => 'users#new'

  resources :users, only:[:index, :show, :create, :update, :destroy] do
    resources :events, only: [:new, :edit, :destroy]
  end

  get 'events/past' => 'events#past'
  resources :events, only: [:index, :show, :create, :update]

  resources :dogs
  resources :breeds, only: [:show, :edit, :update, :destroy]

  get 'login' => 'sessions#new'
  post 'sessions' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
