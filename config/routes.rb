Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :visits
  devise_for :users

  root "visits#index"
end
