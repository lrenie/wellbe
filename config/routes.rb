Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show]
    # resources :sessions, only: [ :new, :show]
  resources :seesions, only: :create
  get '/sessions/new', to: 'sessions#new', as: 'new_session'
  get '/sessions/:id', to: 'sessions#show', as: 'my_session'
  get '/sessions/choice', to: 'sessions#choice'
end

