Rails.application.routes.draw do
  
  get 'session/create'
  # get 'session/destroy'
  resources :users
  resources :categories
  resources :menus
  resources :administrator
  
  get "login" => "session#new"
  post "login" => "session#create"
  get "admin" => "administrator#index"
  get "logout" => "session#logout"
  # get 'menu/index'
  # get 'menu/:id' => 'menu#show'
  # get 'menu/create'
  # get 'menu/update'
  # get 'menu/delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
