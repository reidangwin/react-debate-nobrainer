Rails.application.routes.draw do
  resources :arguments
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "argument#index"
end
