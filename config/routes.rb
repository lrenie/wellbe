Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show]
    resources :sessions, only: [:choice, :new, :show]

  get '/sessions/choice', to: 'sessions#choice'

end

