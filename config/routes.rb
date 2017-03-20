Rails.application.routes.draw do
  resources :support_requests
  root to: "dashboard#index"
  get 'dashboard/index'
  resources :user_types
  get "users" => 'users#index', as: 'users'
  get 'users/:id' => 'users#show', as: 'user'
  get "users/:id/edit" => 'users#edit', as: 'edit_user'
  patch "users/:id" => 'users#update'
  delete "users/:id" => 'users#destroy'
  resources :purchase_order_requests
  resources :project_approval_requests
  resources :time_off_requests
    devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    invitations: 'users/invitations'
  }
end
