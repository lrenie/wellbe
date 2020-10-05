Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show, :index]
  resources :chatrooms, only: [:show, :index] do
    resources :messages, only: :create
  end
  get '/sessions/choice', to: 'sessions#choice'
  get '/sessions/multi/new', to: 'sessions#new_multi', as: 'new_multi_session'
  get '/sessions/solo/new', to: 'sessions#new_solo', as: 'new_solo_session'
  post '/sessions', to: 'sessions#create_multi'
  get '/sessions/:id', to: 'sessions#show', as: 'my_session'
  post '/sessions/fetch', to: 'sessions#fetch'


  # resources :sessions, only: [:new, :create]


  resources :session_participants, only: [:update]

end
