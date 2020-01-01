Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do 
      get "/auto_login", to: "login#auto_login"
      post "/login", to: "login#login"
      get "/user_info", to: "users#user_info"
      patch "/update_user", to: "users#update_user"
      patch "/change_password", to: "users#change_password"
      resources :users, only: [:create]
      resources :reviews, only: [:create, :destroy]
      resources :ratings
      resources :restaurants, only: [:index]
      resources :dishes 
    end
  end
end
