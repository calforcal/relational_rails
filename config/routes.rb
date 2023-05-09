Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/", to: "welcome#bikeshops_index"
  get "/bikeshops", to: "bikeshops#bikeshops_index"
end
