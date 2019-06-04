Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :lobbies, except: %i[index new]

  resources :games do
    resources :lobbies, only: %i[index new]
  end

end
