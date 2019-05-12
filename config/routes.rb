Rails.application.routes.draw do

  resources :cakes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  devise_for :users, skip: [:sessions]
  as :user do
    get 'admin', to: 'devise/sessions#new', as: :new_user_session
    post 'admin', to: 'devise/sessions#create', as: :user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  root to: 'cakes#index'

end
