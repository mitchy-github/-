Rails.application.routes.draw do
  
  root 'users#index'
  
  devise_for :users
  get 'pages/home'
  get '/users/show'
  get '/users/index'
  
  get '/dashboard', to: 'users#dashboard'
  post '/users/edit', to: 'users#update'
  post '/dashboard', to: 'users#update'
  
  resources :rooms, except: [:edit] do
    member do
        get 'listing'
        get 'pricing'
        get 'description'
        get 'photo_upload'
        get 'amenities'
        get 'location'
      end
    collection do
        get 'search', to: 'rooms#search'
      end
  end
  
  devise_for :rooms
  get '/rooms/:id', to: 'rooms#show'
  get '/reservations/:id', to: 'reservations#show'
  get '/reservations/:id', to: 'rooms#show'

  resources :rooms, only: [:index, :new, :create, :show]
  resources :reservations, only: [:index, :new, :create, :show]
  
  get 'reservations/index'
  post 'reservations/confirm'
  get 'rooms/index'
  get 'reservations/index'
  get 'reservations/search'
  get 'rooms/indexindex'
end
