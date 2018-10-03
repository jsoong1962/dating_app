Rails.application.routes.draw do
  resources :searches
  resources :messages
  resources :user_interests
  resources :interests
  resources :matches
  resources :users, only: [:show, :new, :edit, :create, :destroy, :update, :index]

  get 'sessions/new'
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: 'sessions#create'
  delete "/logout", to: 'sessions#destroy'
  post 'sessions', to: "sessions#create", as: "sessions"
  delete 'sessions', to: "sessions#destroy"
  resources :users do
    member do
      get :matching, :matchers
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
