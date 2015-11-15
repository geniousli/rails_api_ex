Rails.application.routes.draw do

  resources :questions do
    resources :answers, shallow: true
  end

  resources :users

  post '/signin', to: "session#create"
  delete '/logout', to: "session#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
