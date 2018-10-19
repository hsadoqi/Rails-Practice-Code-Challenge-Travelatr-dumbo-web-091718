Rails.application.routes.draw do

  post '/posts/:id/likes', to: "posts#likes", as: "like"

  resources :bloggers, only: [:index, :show, :new, :create]
  resources :posts, only: [:create, :new, :edit, :update, :show]
  resources :destinations, only: [:show, :index]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
