Rails.application.routes.draw do

  resource :students, only: [:show, :new, :create, :edit]

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  get 'programs/index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'welcome#index'

  resource :accounts, only: [:show, :new, :create, :edit]
  resource :programs, only: [:index]
  # resource :welcome, only: [ :index ]
end
