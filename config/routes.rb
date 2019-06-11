Rails.application.routes.draw do
  mount ActionCable.server => "/cable"

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  root to: 'pages#home'


  resources :profile, only: %i[show favorites]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :lobbies, except: %i[index new create] do
    resources :messages, only: %i[create]
  end

  resources :games do
    post 'favorites/add_favorite/', to: 'favorites#add_favorite', as: 'add_favorite'
    resources :lobbies, only: %i[index new create]
    resources :favorites, only: %i[update]
  end

  resources :favorites, only: [:new, :create]

  post "/enter_lobby/:id", to: 'lobbies#enter_lobby', as: 'enter_lobby'
  post "/exit_lobby/:id", to: 'lobbies#exit_lobby', as: 'exit_lobby'
end
