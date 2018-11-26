Rails.application.routes.draw do
  ## Override resources values with except command
  resources :portfolios, except: [:show]
  ## Assign custom route to original route as new path name 
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'

end
