Rails.application.routes.draw do
  root 'questions#index'

  resources :answers, only: [:show, :edit, :update, :destroy]

  resources :questions do
    resources :answers, only: [:index, :new, :create]
  end


	match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
	match 'auth/failure', to: redirect('/'), via: [:get, :post]
	match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

end
