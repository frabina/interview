Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'companies#index'
  resources :companies
  #resources :clients
  resources :clients do
    resources :accounts, only: [:new, :create]
  end

end
