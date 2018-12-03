Rails.application.routes.draw do
  resources :memberships
  get 'welcome/index'
  resources :groups do 
    resources :events
  end

  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'pages/my_groups'
  get 'pages/profile'
devise_scope :user do
  get 'users/sign_out' =>'users/sessions#destroy'
end
 resources :users, only: [:show]
#resources :groups do
 #   get 'join', :on => :member
#end
resources :groups, only: [:show], shallow: true do
   resources :memberships, only: [:new] #-> domain.com/2/memberships/new
end
resources :groups do
  member do
    get 'join'
  end
end

end
