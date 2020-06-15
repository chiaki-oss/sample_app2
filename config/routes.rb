Rails.application.routes.draw do
  get '/help', to:'static_pages#help'
  # get 'static_pages/help'
  get '/about', to: 'static_pages#about'
  #get 'static_pages/about'
  get '/contact', to:'static_pages#contact'
  #get 'static_pages_contact'
  root 'static_pages#home'
  #root 'static_pages#home'
  get '/signup', to:'users#new'
  post '/signup', to:'users#create'

  get '/login', to:'sessions#new'
  post 'login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'

  #RESTfulなUsersリソース
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
