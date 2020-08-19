Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :api do
    namespace :v1 do
      
      resources :users

      resources :posts do
        resources :comments
      end

      scope :auth do
        post '/signin' => 'user_token#create'
        post '/signup' => 'users#create'
        get '/current_user' => 'auth#current'
      end

    end
  end


end
