Evry::Application.routes.draw do
  root 'static#welcome'

  devise_for :users

  resources :tasks
end
