Rails.application.routes.draw do

  get '/', to: 'sites#index'
  get '/about_us', to: 'sites#show'

  # routes for users
  resources :users do
    resources :pages
    resources :posts
  end


  # post '/comments', to: "comments#create"
  get '/users/:user_id/tags/:tag_id', to: 'tagusers#show', :as => "tag_user"

  get '/tags', to: 'tags#index'
  get '/tags/:id', to: 'tags#show'
  post "posts/:post_id/comments", to: "comments#create", :as => "post_comments"
  post "posts/:post_id/comments/:id", to: "comments#create", :as => "post_comment"
  #sessions route
   delete "/logout" => "sessions#destroy"
    get "/logout" => 'sessions#destroy'
    get "/login" => "sessions#new"
    post "/login" => "sessions#create"
end
