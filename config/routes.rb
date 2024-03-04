Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }

  resources :categories do
    resources :tasks, except: [:index]
  end

  root "categories#index"

  match "*path", to: "tasks#error", via: :all
end
