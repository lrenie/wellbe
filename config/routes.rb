Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show, :index]
  get '/sessions/choice', to: 'sessions#choice'
  get '/sessions/new', to: 'sessions#new', as: 'new_session'
  get '/sessions/:id', to: 'sessions#show', as: 'my_session'

  resources :sessions, only: :create

  resources :session_participants, only: [:update]
end
