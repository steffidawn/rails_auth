Rails.application.routes.draw do
  root 'main#index'

  #get is getting login form
  get 'login' => 'sessions#new'
  #post is posting to db
  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  resources :user

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
