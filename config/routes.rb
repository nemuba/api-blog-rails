Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :api do
    namespace :v1 do
      
      resources :users

      scope :auth do
        post '/signin' => 'user_token#create'
        post '/signup' => 'users#create'
      end
    end
  end


end
