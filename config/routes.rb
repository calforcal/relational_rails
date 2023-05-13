Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/bikeshops", to: "bikeshops#index"
  get "/bikeshops/new", to: "bikeshops#new"
  post "/bikeshops", to: "bikeshops#create"
  get "/bikeshops/:id", to: "bikeshops#show"
  get "/servicerequests", to: "servicerequests#index"
  get "/servicerequests/:id", to: "servicerequests#show"
  get "/bikeshops/:id/servicerequests", to: "bikeshop_servicerequests#index"
end
