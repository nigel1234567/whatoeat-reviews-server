Rails.application.routes.draw do
  resources :visits
  devise_for :users

  root "visits#index"
end
