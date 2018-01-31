Rails.application.routes.draw do
  resources :arguments do
    resources :events do
      resources :reactions
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "arguments#index"
end
