Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show, :index]
  resources :friendships, only: [:create, :update, :destroy]
  resources :session_participants, only: [:update]


  resources :chatrooms, only: [:show, :index, :new, :create, :destroy] do
    get '/chat_participants/new', to: 'chat_participants#new'
    post '/chat_participants', to: 'chat_participants#create'
    post '/chat_participants/add', to: 'chat_participants#add', as: 'add_chat_participants'
    delete '/chat_participants/:id', to: 'chat_participants#destroy', as: 'delete_chat_participants'
    resources :messages, only: :create
  end

  get '/sessions/choice', to: 'sessions#choice'
  get '/sessions/multi/new', to: 'sessions#new_multi', as: 'new_multi_session'
  get '/sessions/solo/new', to: 'sessions#new_solo', as: 'new_solo_session'
  post '/sessions', to: 'sessions#create_multi'
  get '/sessions/:id', to: 'sessions#show', as: 'my_session'
  post '/sessions/fetch', to: 'sessions#fetch'

  patch '/cover_update', to: 'users#update_cover'

end
