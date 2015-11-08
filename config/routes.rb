Rails.application.routes.draw do

  resources :blogs, :users

  post '/signin', to: "session#create"
  delete '/logout', to: "session#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
