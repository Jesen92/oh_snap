Rails.application.routes.draw do
  get 'users/user_events' => 'users#user_events', :as => 'user_events'

  get 'users/user_images' => 'users#user_images', :as => 'user_images'

  namespace :api do
    namespace :v1 do
      namespace :mobile do
        get 'users_events/create'
      end
    end
  end

  namespace :api do
    namespace :v1 do
      namespace :mobile do
        get 'users_events/index'
      end
    end
  end

  namespace :api do
    namespace :v1 do
      namespace :mobile do
        get 'users_events/show'
      end
    end
  end

  get 'images/index'

  get 'images/show'

  get 'qr_codes/create'


  namespace :api do
    namespace :v1 do
      namespace :mobile do
        get 'users/create'
        get 'users/show'
        get 'users/edit'
        post 'users/update'
        get 'android_sessions/create'
        post 'android_sessions/destroy'
        post 'reset_passwords/create'
        post 'images/create'

        resources :users
        resources :android_sessions
        resources :reset_passwords
        resources :users_events
        resources :images
      end
    end
  end

  resources :events
  resources :qr_codes
  resources :images

  get 'images/users_images' => "images#users_images", :as => "users_images"

  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations', confirmations: 'users/confirmations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'events#index'
end
