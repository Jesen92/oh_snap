Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :mobile do

      end
    end
  end

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

        resources :users
        resources :android_sessions
        resources :reset_passwords
      end
    end
  end

  resources :events
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'events#index'
end
