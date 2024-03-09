Rails.application.routes.draw do
  devise_for :users

  resources :categories do
    resources :tasks, except: [:index]
  end

  root "categories#index"

  match "*path", to: "tasks#error", via: :all
end
