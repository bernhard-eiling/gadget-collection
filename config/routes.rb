Rails.application.routes.draw do

  get 'main/index'

  root 'main#index'

  resources :users do
    resources :gadgets
  end

end