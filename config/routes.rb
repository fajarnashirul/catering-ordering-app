  Rails.application.routes.draw do
    get 'customer_order/index'
    get 'customer_order/show'
    get 'customer_order/new'
  
  root 'session#new'
  

  
  resources :users
  resources :categories
  resources :menus
  resources :administrator
  
  get "login" => "session#new"
  post "login" => "session#create"
  get "admin" => "administrator#index"
  get "logout" => "session#logout"
  get "order_list" => "order_detail#add_cart"
  get "menu_order" => "order_detaul#menu_list"
  get 'session/create'
  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"
  post 'order_details/:id/add' => "order_details#add_quantity", as: "order_detail_add"
  post 'order_details/:id/reduce' => "order_details#reduce_quantity", as: "order_detail_reduce"
  post 'order_details' => "order_details#create"
  get 'order_details/:id' => "order_details#show", as: "order_detail"
  delete 'order_details/:id' => "order_details#destroy"
  # get 'menu/index'
  # get 'menu/:id' => 'menu#show'
  # get 'menu/create'
  # get 'menu/update'
  # get 'menu/delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
