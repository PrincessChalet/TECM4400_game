Rails.application.routes.draw do
  resources :memberships
  get 'welcome/index'
  resources :groups do 
    resources :events
  end

  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#info'
  get 'pages/my_groups'
  get 'pages/profile'
devise_scope :user do
  get 'users/sign_out' =>'users/sessions#destroy'
  get 'users/edit' => 'users/sessions#edit'
end
 resources :users, only: [:show, :edit]
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
