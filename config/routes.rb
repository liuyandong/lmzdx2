Rails.application.routes.draw do
  get 'users/new'
  get 'credit_cards/open'
  get 'credit_cards/debit'
  get 'credit_cards/credit'
  get 'credit_cards/close'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :phones
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to:"users#index"
  resources :users
end
