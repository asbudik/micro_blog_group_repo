Rails.application.routes.draw do

  get '/', to: 'sites#index'
  get '/about_us', to: 'sites#show'

  # routes for users
  resources :users do
    resources :pages
    resources :posts do
      post '/comments', to: "comments#create"
    end
  end

  get '/users/:user_id/tags/:tag_id', to: 'tagusers#show'
  
  get '/tags', to: 'tags#index'
  get '/tags/:id', to: 'tags#show'
end
