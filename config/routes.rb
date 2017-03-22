Rails.application.routes.draw do
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
