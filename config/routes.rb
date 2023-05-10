Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/bikeshops", to: "bikeshops#index"
  get "/bikeshops/:id", to: "bikeshops#show"
  get "/servicerequests", to: "servicerequests#index"
  get "/servicerequests/:id", to: "servicerequests#show"
end
