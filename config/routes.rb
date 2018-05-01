Rails.application.routes.draw do
  resources :dogs
  resources :users do
    resources :events, only: [:new, :create, :edit, :update, :delete]
  end
  resources :events, only: [:index, :show]
  resources :breeds, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
