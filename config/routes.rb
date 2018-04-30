Rails.application.routes.draw do
  resources :dogs, only: [:create, :index, :show, :edit, :update, :delete]
  resources :users do
    resources :dogs, only: [:new]
  end
  resources :events
  resources :breeds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
