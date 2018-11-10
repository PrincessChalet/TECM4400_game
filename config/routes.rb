Rails.application.routes.draw do
  resources :memberships
  get 'welcome/index'
  resources :groups
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'pages/my_groups'
devise_scope :user do
  get 'users/sign_out' =>'users/sessions#destroy'
end
resources :groups do
    get 'join', :on => :member
end

end
