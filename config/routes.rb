  Rails.application.routes.draw do
  
  root 'session#new'
  

  
  get "login" => "session#new"
  post "login" => "session#create"
  get "admin" => "administrator#index"
  get "logout" => "session#logout"
  get "order_list" => "order_details#add_cart"
  get "menu_order" => "order_details#menu_list"
  get 'session/create'
  get 'carts/:id' => "cart#show", as: "cart"
  delete 'carts/:id' => "cart#destroy"
  post 'order_details/:id/add' => "order_details#add_quantity", as: "order_detail_add"
  post 'order_details/:id/reduce' => "order_detaisl#reduce_quantity", as: "order_detail_reduce"
  post 'order_details' => "order_details#create"
  get 'order_details/:id' => "order_details#show", as: "order_detail"
  delete 'order_details/:id' => "order_details#destroy"

  resources :users
  resources :categories
  resources :menus
  resources :administrator
  resources :customer_order
  # get 'menu/index'
  # get 'menu/:id' => 'menu#show'
  # get 'menu/create'
  # get 'menu/update'
  # get 'menu/delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
