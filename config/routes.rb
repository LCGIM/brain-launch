Rails.application.routes.draw do
  resource :accounts, only: [:show, :new, :create, :edit]
  resource :cart, only: [:show]
  resource :programs
  resource :store
  resource :students, only: [:show, :new, :create, :edit]
  resources :order_items, only: [:create, :update, :destroy]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'welcome#index'
  # resource :welcome, only: [ :index ]
end
