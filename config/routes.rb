Rails.application.routes.draw do

  resources :comments, only: [:create, :destroy]
  devise_for :users

  resources :cakes do
    collection do
      get 'search'
    end
    resources :comments, except: [:new, :show, :edit]
  end

  root to: 'cakes#index'

  # match 'cakes/search', to: 'cakes#search', via: [:post, :get], as: :search
  get 'pricing', to: 'pages#pricing'
  get 'about', to: 'pages#about'

end
