Rails.application.routes.draw do
  resources :audit_logs, except: [:edit, :new, :destroy] do 
    member do
      get :confirm
    end
  end  
  namespace :admin do
    # resources :users
    resources :posts
    resources :admin_users
    resources :employees
     
    #root to: "users#index"
    root to: "employees#index"
  end

  resources :posts do 
    member do
      get :approve
    end  
  end    
  devise_for :users, skip: [:registrations]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticated :user do
    root to: 'statics#welcome', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')
end
