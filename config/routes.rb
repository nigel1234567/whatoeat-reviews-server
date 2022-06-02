Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :visits

  root "visits#index"
end
