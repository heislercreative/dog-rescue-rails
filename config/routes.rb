Rails.application.routes.draw do
  resources :dogs

  resources :users do
    resources :events, only: [:new, :edit, :destroy]
  end

  get 'events/past' => 'events#past'
  resources :events, only: [:index, :show, :create, :update]

  resources :breeds, only: [:show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
