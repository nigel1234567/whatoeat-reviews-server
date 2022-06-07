Rails.application.routes.draw do
  resources :places
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :visits

  root "visits#index"
end
