Rails.application.routes.draw do

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  root to: 'pages#home'

  resources :profile, only: %i[show]

  resources :games
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :lobbies, except: %i[index new create]

  resources :games do
    resources :lobbies, only: %i[index new create]
  end

end
