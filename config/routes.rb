Rails.application.routes.draw do
  resources :dogs
  resources :users
  resources :events
  resources :breeds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
