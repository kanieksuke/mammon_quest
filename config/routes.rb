Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  resources :targets, only: [:index, :new, :create, :destroy] do
    resource :budgets, only: [:new, :create]
  end
end
