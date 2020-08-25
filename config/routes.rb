Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  ressources :sessions, only: [:choice]
end
