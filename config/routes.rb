Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :mobile do
        get 'users/create'
        get 'users/show'
        get 'users/edit'
        post 'users/update'
        get 'android_sessions/create'
        post 'android_sessions/destroy'

        resources :users
        resources :android_sessions
      end
    end
  end

  resources :events
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
