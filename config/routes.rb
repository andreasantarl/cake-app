Rails.application.routes.draw do

  resources :cakes do
    collection do
      get 'search'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, skip: [:sessions]
  as :user do
    get 'admin', to: 'devise/sessions#new', as: :new_user_session
    post 'admin', to: 'devise/sessions#create', as: :user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  root to: 'cakes#index'

  # match 'cakes/search', to: 'cakes#search', via: [:post, :get], as: :search
  get 'pricing', to: 'pages#pricing'
  get 'about', to: 'pages#about'

end
