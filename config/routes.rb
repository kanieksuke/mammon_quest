Rails.application.routes.draw do
  root to: 'targets#index'
  
  resources :targets, only: [:index, :new, :create, :destroy] do
    resource :budgets, only: [:new, :create]
  end
end
