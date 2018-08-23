Rails.application.routes.draw do
  resources :phones
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to:"phones#index"
end
