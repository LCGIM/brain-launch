Rails.application.routes.draw do

  get 'store/index'

  get 'store/login'

  get 'store/register'

  get 'store/checkout'

  get 'store/account'

  get 'store/print_materials'

  get 'store/program_exercises'

  get 'store/admin'

  # devise_for :users

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end
  root 'store#index'
    #resource :store, only: [ :index ]
 match ':controller(/:action(/:id(.:format)))' , :via => :get
end
