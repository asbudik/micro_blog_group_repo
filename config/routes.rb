Rails.application.routes.draw do

  # routes for users
  resources :users do
    resources :pages
  end

end
