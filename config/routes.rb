Rails.application.routes.draw do

  resources :comments
  devise_for :users

  resources :cakes do
    collection do
      get 'search'
    end
  end

  root to: 'cakes#index'

  # match 'cakes/search', to: 'cakes#search', via: [:post, :get], as: :search
  get 'pricing', to: 'pages#pricing'
  get 'about', to: 'pages#about'

end
