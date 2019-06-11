Rails.application.routes.draw do
    
    get 'login', to: 'sessions#new'
    get 'login/create', to: 'sessions#create', as: :create_login
    get 'signout', to: 'sessions#destroy', as: 'signout'

    resources :sessions, only: [:create, :new, :destroy]
    resources :allhands do
    	collection do
      		get 'validate'
    	end
    end

  root 'allhands#index'
end
