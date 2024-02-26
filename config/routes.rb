Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }

  resources :categories do
    resources :tasks
  end

  root "categories#index"
end
