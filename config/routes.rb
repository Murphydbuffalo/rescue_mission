Rails.application.routes.draw do
  root 'questions#index'

  resources :answers, only: [:show, :edit, :update, :destroy]

  resources :questions do
    resources :answers, only: [:index, :new, :create]
  end
  
end
