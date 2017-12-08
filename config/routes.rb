Rails.application.routes.draw do
  resources :doctemps
  root to: 'doctemps#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
