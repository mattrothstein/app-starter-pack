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
