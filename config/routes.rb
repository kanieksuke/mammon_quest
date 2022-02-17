Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  resources :targets, only: [:new, :create] do
    resources :budgets, only: [:new, :create]
  end
end
