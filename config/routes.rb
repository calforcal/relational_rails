Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/bikeshops", to: "bikeshops#index"
  get "/bikeshops/new", to: "bikeshops#new"
  post "/bikeshops", to: "bikeshops#create"
  get "/bikeshops/:id", to: "bikeshops#show"
  get "/bikeshops/:id/edit", to: "bikeshops#edit"
  patch "/bikeshops/:id", to: "bikeshops#update"
  delete "/bikeshops/:id", to: "bikeshops#destroy"
  get "/servicerequests", to: "servicerequests#index"
  get "/servicerequests/:id", to: "servicerequests#show"
  get "/servicerequests/:id/edit", to: "servicerequests#edit"
  patch "/servicerequests/:id", to: "servicerequests#update"
  delete "/servicerequests/:id", to: "servicerequests#destroy"
  get "/bikeshops/:id/servicerequests", to: "bikeshop_servicerequests#index"
  get "/bikeshops/:id/servicerequests/new", to: "servicerequests#new"
  get "/bikeshops/:id/servicerequests?sorted=true", to: "bikeshop_servicerequests#index"
  post "/bikeshops/:id/servicerequests", to: "servicerequests#create"
end
