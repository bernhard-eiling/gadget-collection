Rails.application.routes.draw do

  #main
  get     'main/index'
  root    'main#index'

  # sessions
  get     'login'   => 'sessions#new'
  post    'login'   => 'sessions#create'
  get     'logout'  => 'sessions#destroy'

  #users
  get     'signup'  => 'users#new'
  resources :users do
    resources :gadgets
  end

  #gadgets
  get     'search'  => 'gadgets#search'

end