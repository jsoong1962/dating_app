Rails.application.routes.draw do
  resources :messages
  resources :user_interests
  resources :interests
  resources :matches
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
