Rails.application.routes.draw do
  resources :topics, only: [:index, :show]
  resources :comments
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  ## Override resources values with except command
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  ## Assign custom route to original route as new path name 
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'

  
  resources :blogs do
    member do
      get :toggle_status
    end
  end

  mount ActionCable.server => '/cable'
  
  root to: 'pages#home'

end
