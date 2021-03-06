Rails.application.routes.draw do

  root 'users#show'
  get 'signup' => 'users#new'

  resource :user_events, only: [:create, :destroy]

  resources :users, only:[:index, :show, :create, :update, :destroy] do
    resources :events, only: [:index, :new, :show, :edit, :destroy]
  end

  get 'events/past' => 'events#past'
  resources :events, only: [:index, :create, :update]


  resources :dogs
  get 'breeds/top/:rank' => 'breeds#top'
  resources :breeds, only: [:index, :show, :edit, :update, :destroy]

  get 'login' => 'sessions#new'
  post 'sessions' => 'sessions#create'
  get '/auth/facebook/callback' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
