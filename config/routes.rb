Rails.application.routes.draw do


  resources :inventory_locations do
    resources :inventory_items do
      resources :inventory_item_units
    end
  end
  get "search_inventory_location" => "inventory_items#search", as: "search_item"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :support_requests
  root to: "dashboard#index"
  get 'dashboard/index'
  resources :user_types
  resources :users
  get 'inventory_location/:id/checkout/new' => 'checkout#new', as: "new_checkout"
  get 'inventory_location/:id/checkin/new' => 'checkin#new', as: "new_checkin"
  get 'inventory_location/:id/add_item' => "checkin#add_item", as: "add_item"
  get 'inventory_location/:id/select_item' => "checkout#select_item", as: "select_item"
  post 'checkout' => "checkout#create", as: "checkout_items"
  post 'restock' => "checkin#create", as: "restock_items"
  resources :purchase_order_requests
  resources :project_approval_requests
  resources :time_off_requests
    devise_for :users, :path_prefix => 'my', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    invitations: 'users/invitations'
  }
  resources :users
end
