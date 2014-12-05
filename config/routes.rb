Rails.application.routes.draw do

  #main
  get     'main/index'
  root    'main#index'

  # sessions
  get     'login'   => 'sessions#new'
  post    'login'   => 'sessions#create'
  delete  'logout'  => 'sessions#destroy'

  #users
  get     'signup'  => 'users#new'
  resources :users do
    resources :gadgets
  end

end