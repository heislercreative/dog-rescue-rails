Rails.application.routes.draw do
  resources :dogs
  resources :users do
    resources :events, only: [:new]
  end
  resources :events, only: [:create, :index, :show, :edit, :update, :delete]
  resources :breeds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
