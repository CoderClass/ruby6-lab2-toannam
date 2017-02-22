Rails.application.routes.draw do
  root 'welcome#index'
  resources :users
  resources :sessions
  root "home#index"
  delete 'log_out' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
