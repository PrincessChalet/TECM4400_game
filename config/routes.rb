Rails.application.routes.draw do
  get 'welcome/index'
  resources :groups
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'pages/my_groups'
end
