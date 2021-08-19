Rails.application.routes.draw do
  #root 'articles#index'
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles
end
