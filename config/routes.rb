Rails.application.routes.draw do
  resources :notes
  devise_for :users
  get 'about', to: 'pages#about'
  root to: 'pages#home'
end
