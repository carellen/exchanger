Rails.application.routes.draw do
  resources :exchange_rates

  root 'exchange_rates#index'
end
