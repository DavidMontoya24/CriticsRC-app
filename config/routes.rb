Rails.application.routes.draw do
  devise_for :users,
             controllers: { omniauth_callbacks: :callbacks, registrations: "registrations" }
  root "games#index"

  resources :users
  resources :games do
    resources :critics
  end
  resources :companies do
    resources :critics
  end

  resources :critics
  post "/add_platform", to: "games#add_platform"
  delete "/delete_platform", to: "games#delete_platform"
  post "/add_genre", to: "games#add_genre"
  delete "/delete_genre", to: "games#delete_genre"

  post "/add_developer", to: "involved_companies#add_developer"
  delete "/remove_developer", to: "involved_companies#remove_developer"
  post "/add_publisher", to: "involved_companies#add_publisher"
  delete "/remove_publisher", to: "involved_companies#remove_publisher"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
