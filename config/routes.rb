# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Defines the root path route ("/")
# root "articles#index"

Rails.application.routes.draw do
  # GET /about
  get "about-us", to: "about#index", as: :about

  # Alternative
  # get "/", to: "main#index"
  root to: "main#index"

  
end
