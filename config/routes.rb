Rails.application.routes.draw do

  resources :cakes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, skip: [:sessions]
  as :user do
    get 'admin', to: 'devise/sessions#new', as: :new_user_session
    post 'admin', to: 'devise/sessions#create', as: :user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  root to: 'cakes#index'

  get 'price_list', to: 'pages#pricing'
end
